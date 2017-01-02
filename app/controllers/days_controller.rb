class DaysController < ApplicationController
  def index
    @q = Day.ransack(params[:q])
    @days = @q.result(:distinct => true).includes(:projects).page(params[:page]).per(10)

    render("days/index.html.erb")
  end

  def show
    @project = Project.new
    @day = Day.find(params[:id])

    render("days/show.html.erb")
  end

  def new
    @day = Day.new

    render("days/new.html.erb")
  end

  def create
    @day = Day.new

    @day.day = params[:day]

    save_status = @day.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/days/new", "/create_day"
        redirect_to("/days")
      else
        redirect_back(:fallback_location => "/", :notice => "Day created successfully.")
      end
    else
      render("days/new.html.erb")
    end
  end

  def edit
    @day = Day.find(params[:id])

    render("days/edit.html.erb")
  end

  def update
    @day = Day.find(params[:id])

    @day.day = params[:day]

    save_status = @day.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/days/#{@day.id}/edit", "/update_day"
        redirect_to("/days/#{@day.id}", :notice => "Day updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Day updated successfully.")
      end
    else
      render("days/edit.html.erb")
    end
  end

  def destroy
    @day = Day.find(params[:id])

    @day.destroy

    if URI(request.referer).path == "/days/#{@day.id}"
      redirect_to("/", :notice => "Day deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Day deleted.")
    end
  end
end
