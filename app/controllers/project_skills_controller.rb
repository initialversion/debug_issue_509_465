class ProjectSkillsController < ApplicationController
  def index
    @project_skills = ProjectSkill.all

    render("project_skills/index.html.erb")
  end

  def show
    @project_skill = ProjectSkill.find(params[:id])

    render("project_skills/show.html.erb")
  end

  def new
    @project_skill = ProjectSkill.new

    render("project_skills/new.html.erb")
  end

  def create
    @project_skill = ProjectSkill.new

    @project_skill.project_id = params[:project_id]
    @project_skill.skill_id = params[:skill_id]

    save_status = @project_skill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/project_skills/new", "/create_project_skill"
        redirect_to("/project_skills")
      else
        redirect_back(:fallback_location => "/", :notice => "Project skill created successfully.")
      end
    else
      render("project_skills/new.html.erb")
    end
  end

  def edit
    @project_skill = ProjectSkill.find(params[:id])

    render("project_skills/edit.html.erb")
  end

  def update
    @project_skill = ProjectSkill.find(params[:id])

    @project_skill.project_id = params[:project_id]
    @project_skill.skill_id = params[:skill_id]

    save_status = @project_skill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/project_skills/#{@project_skill.id}/edit", "/update_project_skill"
        redirect_to("/project_skills/#{@project_skill.id}", :notice => "Project skill updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Project skill updated successfully.")
      end
    else
      render("project_skills/edit.html.erb")
    end
  end

  def destroy
    @project_skill = ProjectSkill.find(params[:id])

    @project_skill.destroy

    if URI(request.referer).path == "/project_skills/#{@project_skill.id}"
      redirect_to("/", :notice => "Project skill deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Project skill deleted.")
    end
  end
end
