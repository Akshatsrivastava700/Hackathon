class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  $tag = Tag.select(:id, :tag_name).all
end
