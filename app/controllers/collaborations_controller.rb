class CollaborationsController < ApplicationController
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
end
