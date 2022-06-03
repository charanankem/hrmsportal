class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :destroy, :update]
  
  def index 
    @projects = Project.all 
  end

  def new 
    @project = Project.new
  end

  def edit
  end



  def create
    @project = Project.new(dparams)
    respond_to do |format|
    if @project.save 
      format.html { redirect_to projects_url, notice: "Project was successfully created." }
      format.json { render :show, status: :created, location: @project }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @project.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end

  def update 
    respond_to do |format|
    if @project.update(dparams)
      format.html { redirect_to leaves_url, notice: "Leave was successfully updated." }
      format.json { render :show, status: :updated, location: @project }
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @project.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
end
  
  def destroy 
    @project.destroy 
    redirect_to projects_path
  end


  def set_project
    @project = Project.find(params[:id])
  end

  def dparams
    params.require(:project).permit(:name,:description,:manager_id,:project_lead_id)
  end
end
