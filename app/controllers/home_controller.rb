class HomeController < ApplicationController
  before_action :logged_in?
  def index
      @challenges     = Challenge.paginate(page: params[:page])
      @collaborations = Collaboration.all
      @tag            = Tag.select(:id, :tag_name).all
  end
end
