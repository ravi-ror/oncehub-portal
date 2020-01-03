class ApplicationController < ActionController::Base
  include HttpAuthConcern

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || profile_path
  end
end
