class VotesController < ApplicationController
  before_action :check_eligibility, only: [:create, :destroy]

  #This action is used to create the vote of a user on a challenge
  def create
      if  vote.add == 1
        redirect_to root_path, notice: "Vote Added!"
      else
        redirect_to root_path, alert: "Error: Vote not added!"
      end
  end

  #This action is used to destroy the vote of a user on a challenge
  def destroy
    if vote.delete == 1
      redirect_to root_path, notice: "Vote Removed!"
    else
      redirect_to root_path, alert: "Error: Vote not removed!"
    end
  end

  private
  #returns the object of VoteCollaboration object
  def vote
    return( VoteCollaboration.new("Vote", params[:challenge_id], current_user.id ) )
  end

  # This method checks before an action is executed if the user is the owner of the challenge and if he is trying to Vote.
  #If the request cam from a owner he/she id not allowed to vote.
  def check_eligibility
    if params[:user_id].to_i == current_user.id
      redirect_to root_path, alert: "Error: Owner can't vote"
    end
  end
end
