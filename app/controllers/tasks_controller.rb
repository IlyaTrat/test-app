class TasksController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @task = Task.new(project_id: params[:project_id])
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        if(@task.update(task_params))
            redirect_to project_path(params[:project_id])
        else
            render 'edit'
        end
    end
    
    def create
        @task = Task.new(task_params)
        
        if(@task.save)
            redirect_to project_path(params[:project_id])
        else
            render 'new'
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        redirect_to project_path(params[:project_id])
    end
    
    private def task_params
        params.require(:task).permit(:title, :description, :status, :user_id, :project_id)
    end
end
