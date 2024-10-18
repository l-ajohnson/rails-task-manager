class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(filtered_params)
    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(filtered_params)
    redirect_to task_path(@task)
  end

  private

  def filtered_params
    params.require(:task).permit(:title, :details)
  end

end
