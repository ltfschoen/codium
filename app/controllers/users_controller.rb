class UsersController < ApplicationController
  skip_before_action :authenticate_user!, except: [:profile]

  before_action :set_user, only: [:show]
  before_action :set_current_user, only: [:profile]
  before_action :set_title, only: [:show, :profile]

  def profile
    render :'users/show'
  end

  def show

  end

  private
  def set_user
    @user = User.friendly.find_by(username: params[:username])
    unless @user
      flash[:error] = "That user doesn't exits"
      redirect_to '/'
    end
  end

  def set_current_user
    @user = current_user
  end

  def set_title
    @title = @user.username
  end
end
