class Developer::DashboardsController < Developer::BaseController
  def index
    @todos = current_person.todos.includes(:project)
  end
end
