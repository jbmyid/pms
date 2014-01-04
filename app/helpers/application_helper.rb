module ApplicationHelper

  def current_role
    "#{current_person.class}".downcase
  end

  def logo_link
    return "#" unless signed_in?
    current_person.admin? ? admin_dashboards_path : developer_dashboards_path
  end
end
