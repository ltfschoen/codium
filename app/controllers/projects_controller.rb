class ProjectsController < ApplicationController
before_action :set_project, only: [ :show, :edit, :update, :destroy]

def index
  @projects = Project.order("created_at desc").all
end

def new
  @project = Project.new
  @users = User.all
  @membership = Membership.new
end

def show
  @membership = Membership.new
end

def edit
  @users = User.all
  @membership = Membership.new
end

def create
  @project = Project.new(project_params)

  if @project.save
    add_current_user_as_member
    redirect_to @project, notice:"Project was successfully created"
  else
    render action:"new", notice:"something went wrong here .."
  end
end

def update
end

def destroy
end

private



def add_current_user_as_member
  @project.members << current_user
end

def set_project
  @project = Project.find_by_id params[:id]
end

# Never trust parameters from the scary internet, only allow the white list through.
def project_params
  params.require(:project).permit(:name,:image)
  end


end