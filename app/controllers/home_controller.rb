class HomeController < ApplicationController
  def index
    if user_signed_in?
      @challenges     = Challenge.all
      @collaborations = Collaboration.all
      @tag            = Tag.all
    else
      redirect_to new_user_session_path
    end
  end

  def remove_user
    if User.remove_user(current_user.id) == 1
      redirect_to new_user_session_path, alert: "Account Deleted !"
    else
      redirect_to root_path, alert: "Account Not Deleted !"
    end
  end
end
