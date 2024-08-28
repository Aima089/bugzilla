class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create]
  
  def index
    @bugs = Bug.all
  end
def new
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.build
  end
  
  def create
    Rails.logger.debug "Bug Params: #{bug_params.inspect}"
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
  def assign
    @bug = Bug.find(params[:id])
    @user = User.find(params[:user_id])

    # Assign the bug to the user
    @bug.update(assigned_to: @user)

    # Enqueue a job to send an email notification
    NotificationJob.perform_later(@user.id, 'Bug Assigned')

    redirect_to @bug, notice: 'Bug was successfully assigned.'
  end

  def set_project


    @project = Project.find_by(id: params[:project_id])
    
    if @project.nil?
      redirect_to projects_path, alert: 'Project not found.'
    end
  end
end
