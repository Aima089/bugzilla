class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:search, :new, :create]

  def index
    @bugs = @project.bugs
  end

  def search
    @bugs = @project.bugs.where("title LIKE ?", "%#{params[:key]}%")
    Rails.logger.debug "Search query: #{params[:key]}"
    Rails.logger.debug "Found bugs: #{@bugs.inspect}"
    # Render the 'projects/show' template to stay on the project page
    render 'projects/show'
  end

  def new
    @bug = @project.bugs.build
  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.user = current_user

    if @bug.save
      redirect_to project_path(@project), notice: 'Bug created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :bug_type, :status, :deadline, :screenshot, :project_id)
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
    if @project.nil?
      redirect_to projects_path, alert: 'Project not found.'
    end
  end
end
