class HomeController < ApplicationController
  def index
    if user_signed_in?
      @challenges     = Challenge.all
      @collaborations = Collaboration.all
      @tag            = Tag.all
    else
      redirect_to new_user_session_path, notice: 'Kindly Login !'
    end
  end
end
