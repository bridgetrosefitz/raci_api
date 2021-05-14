class Api::V1::MembershipsController < ApplicationController
   def create
    membership = Membership.create!(membership_params)
    render json: membership
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.delete
    render json: "Successfully deleted"
  end

  def membership_params
    params.permit(:user_id, :project_id)
  end
end
