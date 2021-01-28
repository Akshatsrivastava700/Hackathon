class VotesController < ApplicationController
  before_action :check_eligibility, only: [:create, :destroy]
  def create
      if  @@vote.add == 1
        redirect_to root_path, notice: "Vote Added!"
      else
        redirect_to root_path, alert: "Error: Vote not added!"
      end
  end

  def destroy
    if @@vote.delete == 1
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

    @@vote = VoteCollaboration.new("Vote", params[:challenge_id], current_user.id )
  end
end
