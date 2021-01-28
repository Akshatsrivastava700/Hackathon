class CollaborationsController < ApplicationController
  before_action :check_eligibility, only: [:create, :destroy]
  def create
      if Collaboration.add_collaboration(params[:challenge_id], current_user.id) == 1
        redirect_to root_path, notice: "Collaboration Added!"
      else
        redirect_to root_path, alert: "Error: Collaboration not Added"
      end
  end

  def destroy
    if Collaboration.delete_collaboration(params[:challenge_id], current_user.id) == 1
      redirect_to root_path, notice: "Collaboration Removed!"
    else
      redirect_to root_path, alert: "Error: Collaboration not removed!"
    end
  end

  private
  def check_eligibility
    if params[:user_id].to_i == current_user.id
      redirect_to root_path, alert: "Error: Owner can't collaborate"
    end
  end
end
