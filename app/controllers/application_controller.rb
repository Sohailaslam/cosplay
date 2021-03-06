class ApplicationController < ActionController::Base

  # Rescue from CanCan::AccessDenied exception
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to authenticated_root_url, notice: exception.message }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  # Overriding devise after_sign_in_path_for
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || costumes_path
  end

end
