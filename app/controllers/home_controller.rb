class HomeController < ApplicationController
  def index
    if user_signed_in?
      @challenges     = Challenge.paginate(page: params[:page])
      @collaborations = Collaboration.all
      @tag            = Tag.select(:id, :tag_name).all
    else
      redirect_to new_user_session_path
    end
  end
end
