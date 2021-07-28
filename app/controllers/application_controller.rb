class ApplicationController < ActionController::API

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :doorkeeper_authorize!
  respond_to :json

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
