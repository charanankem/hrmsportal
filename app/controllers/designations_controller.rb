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

  def create
    @designation = Designation.new(dparams)
    respond_to do |format|
    if @designation.save 
      format.html { redirect_to designations_url, notice: "Holiday was successfully created." }
      format.json { render :show, status: :created, location: @designation }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @designation.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end

  def update 
    respond_to do |format|
    if @designation.update(dparams)
      format.html { redirect_to leaves_url, notice: "Leave was successfully updated." }
      format.json { render :show, status: :updated, location: @designation}
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @designation.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
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
