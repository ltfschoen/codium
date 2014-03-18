class MembershipsController < ApplicationController
before_action :set_membership, only: [ :show, :edit, :update, :destroy]

def create
  @membership = Membership.create(membership_params)
  if @membership.save
    respond_to do |format|
      format.js
    end
  end
end

def destroy
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


def membership_params
  params.require(:membership).permit(:project_id, :member_id)
end

end