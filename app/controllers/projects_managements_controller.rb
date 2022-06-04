class ProjectsManagementsController < ApplicationController
  before_action :set_projectmanagement, only: [:edit, :destroy, :update]
  
  def index 
    @projects_managements = ProjectsManagement.all 
  end

  def new 
    @projects_management = ProjectsManagement.new
  end

  def edit
  end

  def create
    @projects_management = ProjectsManagement.new(dparams)
    respond_to do |format|
    if @projects_management.save 
      format.html { redirect_to projects_url, notice: "Project management was successfully created." }
      format.json { render :show, status: :created, location: @projects_management }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @projects_management.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end

  def update 
    respond_to do |format|
    if @projects_management.update(dparams)
      format.html { redirect_to projects_managements_url, notice: "Leave was successfully updated." }
      format.json { render :show, status: :updated, location: @projects_management }
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @projects_management.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
end
  
  def destroy 
    @projects_management.destroy 
    redirect_to projects_managements_path
  end


  def set_projectmanagement
    @projects_management = ProjectsManagement.find(params[:id])
  end

  def dparams
    params.require(:projects_management).permit(:project_name, :client,:manager_id,:description,:client_time_zone,:shift_information,:project_type)
  end
end
