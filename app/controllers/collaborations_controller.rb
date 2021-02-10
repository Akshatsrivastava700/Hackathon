class CollaborationsController < ApplicationController
  before_action :check_eligibility, only: [:create, :destroy]

  #This action allows a user to create a collaboration on a challenge.
  def create
      if collaboration.add == 1
        redirect_to root_path, notice: "Collaboration Added!"
      else
        redirect_to root_path, alert: "Error: Collaboration not Added"
      end
  end
  #This action allows a user to destroy a collaboration on a challenge.
  def destroy
    if collaboration.delete == 1
      redirect_to root_path, notice: "Collaboration Removed!"
    else
      redirect_to root_path, alert: "Error: Collaboration not removed!"
    end
  end

  private
  #returns the object of VoteCollaboration object
  def collaboration
    return( VoteCollaboration.new("Collaboration", params[:challenge_id], current_user.id ) )
  end

  # This method checks before an action is executed if the user is the owner of the challenge and if he is trying to Vote.
  #If the request cam from the owner he/she id not allowed to vote.
  def check_eligibility
    if params[:user_id].to_i == current_user.id
      redirect_to root_path, alert: "Error: Owner can't collaborate"
    end
  end
end
