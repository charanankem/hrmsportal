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
    respond_to do |format|
    if @holiday.save 
      format.html { redirect_to holidays_url, notice: "Holiday was successfully created." }
      format.json { render :show, status: :created, location: @holiday }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @holiday.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end


    def update 
      respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to leaves_url, notice: "Leave was successfully updated." }
        format.json { render :show, status: :updated, location: @holiday}
      else  
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
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
