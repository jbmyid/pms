module ApplicationHelper

  def current_role
    "#{current_person.class}".downcase
  end

  def logo_link
    return "#" unless signed_in?
    current_person.admin? ? admin_dashboards_path : developer_dashboards_path
  end

  def developers_options
    Developer.select("id, name").map{|d|[d.name,d.id]}    
  end
end
