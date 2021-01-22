class VotesController < ApplicationController
  def create
    if Vote.check(params[:challenge_id], current_user.id) == 1
      if Vote.delete_vote(params[:challenge_id], current_user.id) == 1
        redirect_to root_path, notice: "Vote Removed!"
      else
        redirect_to root_path, alert: "Error: Vote not removed!"
      end
    else
      if Vote.add_vote(params[:challenge_id], current_user.id) == 1
        redirect_to root_path, notice: "Vote Added!"
      else
        redirect_to root_path, alert: "Error: Vote not Added"
      end
    end
  end
end
