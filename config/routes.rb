Rails.application.routes.draw do
  # Routes for the Project_skill resource:
  # CREATE
  get "/project_skills/new", :controller => "project_skills", :action => "new"
  post "/create_project_skill", :controller => "project_skills", :action => "create"

  # READ
  get "/project_skills", :controller => "project_skills", :action => "index"
  get "/project_skills/:id", :controller => "project_skills", :action => "show"

  # UPDATE
  get "/project_skills/:id/edit", :controller => "project_skills", :action => "edit"
  post "/update_project_skill/:id", :controller => "project_skills", :action => "update"

  # DELETE
  get "/delete_project_skill/:id", :controller => "project_skills", :action => "destroy"
  #------------------------------

  # Routes for the Location resource:
  # CREATE
  get "/locations/new", :controller => "locations", :action => "new"
  post "/create_location", :controller => "locations", :action => "create"

  # READ
  get "/locations", :controller => "locations", :action => "index"
  get "/locations/:id", :controller => "locations", :action => "show"

  # UPDATE
  get "/locations/:id/edit", :controller => "locations", :action => "edit"
  post "/update_location/:id", :controller => "locations", :action => "update"

  # DELETE
  get "/delete_location/:id", :controller => "locations", :action => "destroy"
  #------------------------------

  # Routes for the Day resource:
  # CREATE
  get "/days/new", :controller => "days", :action => "new"
  post "/create_day", :controller => "days", :action => "create"

  # READ
  get "/days", :controller => "days", :action => "index"
  get "/days/:id", :controller => "days", :action => "show"

  # UPDATE
  get "/days/:id/edit", :controller => "days", :action => "edit"
  post "/update_day/:id", :controller => "days", :action => "update"

  # DELETE
  get "/delete_day/:id", :controller => "days", :action => "destroy"
  #------------------------------

  # Routes for the Skill resource:
  # CREATE
  get "/skills/new", :controller => "skills", :action => "new"
  post "/create_skill", :controller => "skills", :action => "create"

  # READ
  get "/skills", :controller => "skills", :action => "index"
  get "/skills/:id", :controller => "skills", :action => "show"

  # UPDATE
  get "/skills/:id/edit", :controller => "skills", :action => "edit"
  post "/update_skill/:id", :controller => "skills", :action => "update"

  # DELETE
  get "/delete_skill/:id", :controller => "skills", :action => "destroy"
  #------------------------------

  # Routes for the Project resource:
  # CREATE
  get "/projects/new", :controller => "projects", :action => "new"
  post "/create_project", :controller => "projects", :action => "create"

  # READ
  get "/projects", :controller => "projects", :action => "index"
  get "/projects/:id", :controller => "projects", :action => "show"

  # UPDATE
  get "/projects/:id/edit", :controller => "projects", :action => "edit"
  post "/update_project/:id", :controller => "projects", :action => "update"

  # DELETE
  get "/delete_project/:id", :controller => "projects", :action => "destroy"
  #------------------------------

  devise_for :organizations
  # Routes for the Organization resource:
  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
