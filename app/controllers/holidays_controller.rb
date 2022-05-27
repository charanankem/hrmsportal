class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:edit, :destroy, :update]
  
  def index 
    @holidays = Holiday.all 
  end

  def new 
    @holiday = Holiday.new
  end

  def edit
    
  end

  def create 
    @holiday = Holiday.new(holiday_params)
    if @holiday.save 
      #render plain: @designations.inspect
      redirect_to holidays_path
    else  
      render action: 'new'
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end





  def update 
    
    if @holiday.update(holiday_params)
      redirect_to holidays_path
    else  
      render action: 'edit' 
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end

end
  
  def destroy 
    @holiday.destroy 
    redirect_to holidays_path
  end


  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:name, :date, :year)
  end

end
