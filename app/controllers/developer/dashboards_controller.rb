class Developer::DashboardsController < Developer::BaseController
  def index
    # @data = Todo.join("LEFT JOIN people d ON d.id=todos.developer_id").select("todos.name as todo_name, d.name as dev_name, d.id as d_id").group_by{|t|t.d_id}
  end
end
