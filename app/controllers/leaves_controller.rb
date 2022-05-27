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
    if @leave.save 
      #render plain: @designations.inspect
      redirect_to leaves_path
    else  
      render 'new'
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end

  def update 
    if @leave.update(leave_params)
      redirect_to leaves_path
    else  
      render 'edit'
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
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
