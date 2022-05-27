class DesignationsController < ApplicationController
  before_action :set_designation, only: [:edit, :destroy, :update]
  
  def index 
    @designations = Designation.all 
  end

  def new 
    @designation = Designation.new
  end

  def edit
  end

  def create 
    @designation = Designation.new(dparams)
    if @designation.save 
      #render plain: @designations.inspect
      redirect_to designations_path
    else  
      render 'new'
    end
  end

  def update 
    if @designation.update(dparams)
      redirect_to designations_path
    else  
      render 'edit'
    end
  end
  
  def destroy 
    @designation.destroy 
    redirect_to designations_path
  end


  def set_designation
    @designation = Designation.find(params[:id])
  end

  def dparams
    params.require(:designation).permit(:name, :description)
  end
end
