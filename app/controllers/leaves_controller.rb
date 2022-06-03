class LeavesController < ApplicationController
  before_action :set_leave, only: [:edit, :destroy, :update]
  
  def index 
    @leaves = Leave.all 
  end

  def new 
    @leave = Leave.new
  end

  def edit
  end

  def create
    @leave = Leave.new(leave_params)
    respond_to do |format|
    if @leave.save 
      format.html { redirect_to leaves_url, notice: "Leave was successfully created." }
      format.json { render :show, status: :created, location: @leave }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @leave.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end

  def update 
    respond_to do |format|
    if @leave.update(leave_params)
      format.html { redirect_to leaves_url, notice: "Leave was successfully updated." }
      format.json { render :show, status: :updated, location: @leave }
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @leave.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
end
  
  def destroy 
    @leave.destroy 
    redirect_to leaves_path
  end


  def set_leave
    @leave = Leave.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:name, :description,:no_of_days)
  end
end
