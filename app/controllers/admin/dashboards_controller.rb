class Admin::DashboardsController < Admin::BaseController
  def index
    @developers = Developer.select("name, id")
    @projects = Project.select("name, id")
    @data = Developer.joins("LEFT JOIN todos t ON people.id=t.developer_id").#.where("people.id IS NOT NULL").
    joins("LEFT JOIN projects p ON p.id=t.project_id").
    select("t.name as todo_name, people.name as dev_name, people.id as d_id, t.id as t_id,t.state as state, p.name as p_name, p.id as p_id")
  end
end
