class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  $tag = Tag.select(:id, :tag_name).all

  private
  #This method check if the user is logged in.
  def logged_in?
    if current_user == nil
      redirect_to new_user_session_path, alert: "Kindly Login!"
   end
  end
end
