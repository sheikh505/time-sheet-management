class ApplicationController < ActionController::Base

  before_action :authenticate_user!



  def after_sign_in_path_for(resource)

    if resource.role.name == "Admin"

      users_path

    elsif resource.role.name == "Manager"

      users_path

    else

      users_path

    end

  end















end
