class TasksController < ApplicationController
  before_action :set_task, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new, :create, :show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
   if @task.save 
    redirect_to root_path
   else
    render :new
   end
  end

  def show
    
    @comment = Comment.new
    @comments = @task.comments.includes(:user)
  end

  def edit
    
  end

  def update
    
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    
    @task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
