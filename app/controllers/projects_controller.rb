class ProjectsController < ApplicationController
  before_action :current_user_must_be_project_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_project_organization
    project = Project.find(params[:id])

    unless current_user == project.organization
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(:distinct => true).includes(:organization, :project_skills, :date, :location).page(params[:page]).per(10)

    render("projects/index.html.erb")
  end

  def show
    @project_skill = ProjectSkill.new
    @project = Project.find(params[:id])

    render("projects/show.html.erb")
  end

  def new
    @project = Project.new

    render("projects/new.html.erb")
  end

  def create
    @project = Project.new

    @project.name = params[:name]
    @project.location_id = params[:location_id]
    @project.day_id = params[:day_id]
    @project.description = params[:description]
    @project.number_of_volunteers_required = params[:number_of_volunteers_required]
    @project.organization_id = params[:organization_id]

    save_status = @project.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projects/new", "/create_project"
        redirect_to("/projects")
      else
        redirect_back(:fallback_location => "/", :notice => "Project created successfully.")
      end
    else
      render("projects/new.html.erb")
    end
  end

  def edit
    @project = Project.find(params[:id])

    render("projects/edit.html.erb")
  end

  def update
    @project = Project.find(params[:id])

    @project.name = params[:name]
    @project.location_id = params[:location_id]
    @project.day_id = params[:day_id]
    @project.description = params[:description]
    @project.number_of_volunteers_required = params[:number_of_volunteers_required]
    @project.organization_id = params[:organization_id]

    save_status = @project.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projects/#{@project.id}/edit", "/update_project"
        redirect_to("/projects/#{@project.id}", :notice => "Project updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Project updated successfully.")
      end
    else
      render("projects/edit.html.erb")
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    if URI(request.referer).path == "/projects/#{@project.id}"
      redirect_to("/", :notice => "Project deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Project deleted.")
    end
  end
end
