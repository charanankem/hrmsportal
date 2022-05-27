class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:edit, :destroy, :update]
  
  def index 
    @attendances = current_employee.attendances
    @c=current_employee.attendances.where(login:Date.today.beginning_of_day..Date.today.end_of_day).first
  end

  def new 
    @attendance = current_employee.attendances.new(login:DateTime.now)
  end

  
  def edit
    @attendance.logout = DateTime.now
  end

  def create 
    @attendance = current_employee.attendances.new(attendanceparams)
    if @attendance.save 
      #render plain: @designations.inspect
      redirect_to attendances_path
    else  
      render 'new'
    end
  end

  def update 
    if @attendance.update(attendanceparams)
      redirect_to  attendances_path
    else  
      render 'edit'
    end
  end
  
  def destroy 
    @attendance.destroy 
    redirect_to attendances_path
  end


  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendanceparams
    params.require(:attendance).permit(:login, :logout,:reason,:employee_id)
  end
end
