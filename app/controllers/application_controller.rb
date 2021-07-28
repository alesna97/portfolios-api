class ApplicationController < ActionController::API
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  respond_to :json

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
