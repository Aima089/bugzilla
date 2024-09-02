class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
    def index
      @projects = policy_scope(Project) # Ensure the user sees the correct scope of projects
      @project = Project.all
    end
    
    def search
      @projects = Project.where("name LIKE ?", "%#{params[:key]}%")
      render :index
    end

    def new
      @project = Project.new
    end
  
    def create
      @project = Project.new(project_params)
      authorize @project # Authorize the project based on the policy
  
      if @project.save
        redirect_to projects_path, notice: 'Project created successfully'
      else
        render :new, status: :unprocessable_entity
      end
    end
    
  
    def show
      # @project is already set by before_action
      authorize @project
    end
  
    def edit
      # @project is already set by before_action
      authorize @project
    end
  
    def update
      # @project is already set by before_action
      authorize @project
  
      if @project.update(project_params)
        redirect_to projects_path, notice: 'Project updated successfully'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      # @project is already set by before_action
      authorize @project
      @project.destroy
      redirect_to projects_path, notice: 'Project deleted successfully'
    end
  
    private
  
    def set_project
      @project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:name, :description)
    end
   
    end