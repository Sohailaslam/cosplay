class ApplicationController < ActionController::Base

  # Overriding devise after_sign_in_path_for
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || costumes_path
  end

end
