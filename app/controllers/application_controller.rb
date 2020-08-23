class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.instance_of? Parent
      parents_root_path
    else
      manager_root_path
    end
  end
end
