class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    
    def show
        @project = Project.find(params[:id])
    end
    
    def new
        
    end
    
    def create
        @project = Project.new(project_params)
        begin
            @project.save
        rescue => ex
            logger.error ex.message
        end
        
        redirect_to @project
    end
    
    private def project_params
        params.require(:project).permit(:name, :summary, :start_date, :end_date)
    end
end
