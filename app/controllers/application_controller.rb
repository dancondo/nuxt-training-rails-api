class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
  protect_from_forgery
  before_action :authenticate_user!
end
