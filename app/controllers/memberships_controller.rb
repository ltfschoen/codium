class MembershipsController < ApplicationController
before_action :set_membership, only: [ :show, :edit, :update, :destroy]

rescue_from Pundit::NotAuthorizedError, :with => :unauthorized_error

def create

  @membership = Membership.create(membership_params)
  authorize @membership
  if @membership.save
    respond_to do |format|

      format.js
    end
  end
end

def destroy
  authorize @membership

  if @membership.destroy
    respond_to do |format|
      format.js
    end 
  end   
end


private

def set_membership
  @membership = Membership.find_by_id params[:id]
end

def unauthorized_error
  redirect_to posts_path, :alert => "You can't change this!"
end


def membership_params
  params.require(:membership).permit(:project_id, :member_id)
end

end