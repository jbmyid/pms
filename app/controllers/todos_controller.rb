class TodosController < ResourceController
  
  def next
    @todo.next
    redirect_to :back
  end

  private
  def klass
    @project ||= Project.find(params[:project_id])
    @project.todos
  end

  def after_create_path
    project_todos_path
  end

  def after_update_path
    project_todos_path
  end
  def after_destroy_path
    project_todos_path
  end
end
