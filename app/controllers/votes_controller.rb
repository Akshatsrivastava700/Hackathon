class VotesController < ApplicationController
  def create
      if  Vote.add_vote(params[:challenge_id], current_user.id) == 1
        redirect_to root_path, notice: "Vote Added!"
      else
        redirect_to root_path, alert: "Error: Vote not added!"
      end
  end

  def remove_vote
    if Vote.delete_vote(params[:challenge_id], current_user.id) == 1
      redirect_to root_path, notice: "Vote Removed!"
    else
      redirect_to root_path, alert: "Error: Vote not removed!"
    end
  end
end
