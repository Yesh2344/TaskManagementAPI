class TasksController < ApplicationController
  def index
    tasks = Task.where(user_id: @current_user.id)
    render json: tasks, status: :ok
  end

  def create
    task = Task.new(task_params)
    task.user_id = @current_user.id
    if task.save
      render json: task, status: :created
    else
      render json: { error: 'Failed to create task' }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end