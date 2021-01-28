class VotesController < ApplicationController
  before_action :check_eligibility, only: [:create, :destroy]
  def create
      if  Vote.add_vote(params[:challenge_id], current_user.id) == 1
        redirect_to root_path, notice: "Vote Added!"
      else
        redirect_to root_path, alert: "Error: Vote not added!"
      end
  end

  def destroy
    if Vote.delete_vote(params[:challenge_id], current_user.id) == 1
      redirect_to root_path, notice: "Vote Removed!"
    else
      redirect_to root_path, alert: "Error: Vote not removed!"
    end
  end

  private
  def check_eligibility
    if params[:user_id].to_i == current_user.id
      redirect_to root_path, alert: "Error: Owner can't vote"
    end
  end
end
