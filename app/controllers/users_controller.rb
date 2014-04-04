class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:profile, :index]

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:profile]
  before_action :set_title, only: [:show, :profile]
  def index
    @users = User.all
  end

  rescue_from Pundit::NotAuthorizedError, :with => :unauthorized_error

  def new
    @user = User.new
    authorize @user
  end

  def profile
    render :'users/show'
  end

  def show
    @user = User.find_by(username: params[:id])
    @projects = @user.projects 
  end

  def edit
  end

  def createstudent

    @user = User.new(user_params)

    authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @user
    
    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'User was successfully deleted.' }
    end
  end

  private

  def set_user
    @user = User.friendly.find_by(username: params[:id])
    unless @user
      flash[:error] = "That user doesn't exist"
      redirect_to '/'
    end
  end

  def set_current_user
    @user = current_user
  end

  def set_title
    @title = @user.username
  end

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:username,:given_name,:family_name,:tagline,:bio, :twitter, :linkedin, :github, :website, :rss)
  end

  def unauthorized_error
    redirect_to '/', :alert => "You can't change this!"
  end
end
