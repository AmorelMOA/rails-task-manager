class TasksController < ApplicationController

  def index
    @tasks = Task.all
    end

  def new
    @tasks = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task.destroy
    redirect_to task_path
  end

  def edit
  end
  
  def create
    @tasks = Task.new(task_params)
    if @tasks.save

      redirect_to task_path(@tasks)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
