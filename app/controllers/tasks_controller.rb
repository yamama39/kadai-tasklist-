class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end
  
  def show
    @task=Task.find_by(id: params[:id])
  end
  
  def new
    @task=Task.new
  end
  
  def create
    @task=Task.new(task_params)
    
    if @task.save
      flash[:success]="Taskが正常に投稿されました"
      redirect_to(@task)
    else
      flash.now[:danger]="Taskが投稿されませんでした"
      render(new.task_path)
    end
  end
  
  def edit
    @task=Task.find_by(id: params[:id])
  end
    
  def update
      @task = task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render(edit_task_path(@task))
    end

  end
  
  def destroy
    @task=Task.find_by(id:params[:id])
    @task.destroy

    flash[:success] = 'task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
end