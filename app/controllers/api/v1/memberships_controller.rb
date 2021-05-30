class Api::V1::MembershipsController < ApplicationController
  def create
    membership = Membership.new(membership_params)
    if membership.valid?
      membership.save!
      render json: membership 
    else
      render json: { errors: membership.errors.full_messages }, status: :unprocessable_entity 
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.destroy
    render json: "Successfully deleted"
  end

  def membership_params
    params.permit(:user_id, :project_id)
  end
end
