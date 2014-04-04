class ProjectsController < ApplicationController
before_action :set_project, only: [ :show, :edit, :update, :destroy]
rescue_from Pundit::NotAuthorizedError, :with => :unauthorized_error

def index
  @projects = Project.order("created_at desc").all
end

def new
  @project = Project.new
  authorize @project

  @users = User.all
  @membership = Membership.new
end

def show
  @membership = Membership.new
end

def edit
  authorize @project

  @users = User.all
  @membership = Membership.new
end

def create
  @project = Project.new(project_params)

  authorize @project

  if @project.save
    add_current_user_as_member
    redirect_to @project, notice:"Project was successfully created"
  else
    render action:"new", notice:"something went wrong here .."
  end
end

def update

  authorize @project

  respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Event was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
end

def destroy
  authorize @project
end

private



def add_current_user_as_member
  @project.members << current_user
end

def set_project
  @project = Project.find_by_id params[:id]
end

def unauthorized_error
  redirect_to posts_path, :alert => "You can't change this!"
end

# Never trust parameters from the scary internet, only allow the white list through.
def project_params
  params.require(:project).permit(:name,:image, :url, :description)
  end


end