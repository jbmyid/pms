class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_person!

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboards_path
    else
      developer_dashboards_path
    end
  end

end
