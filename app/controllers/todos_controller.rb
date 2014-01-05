class TodosController < ResourceController
  
  def next
    @todo.next
    redirect_to :back
  end

  def change_state
    @todo.update_column(:state, params[:state]) if Todo::STATES.map{|i,v|v}.include?(params[:state])
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
