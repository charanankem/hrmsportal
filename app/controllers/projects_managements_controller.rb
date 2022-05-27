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
    if @projects_management.save 
      #render plain: @designations.inspect
      redirect_to projects_managements_path
    else  
      render 'new'
    end
  end

  def update 
    if @projects_management.update(dparams)
      redirect_to projects_managements_path
    else  
      render 'edit'
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
