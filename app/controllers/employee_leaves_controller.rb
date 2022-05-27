class EmployeeLeavesController < ApplicationController
  before_action :set_employee_leave, only: [:edit, :destroy, :update]
  
  def index 
    @employee_leaves = EmployeeLeave.all 
  end

  def new
    @employee_leave = EmployeeLeave.new

  end

  def edit
  end

  def create 
    @employee_leave = current_employee.employee_leaves.new(emp_params)
    
    if @employee_leave.save 
      redirect_to employee_leaves_path
    else  
      render 'new'
    end
  end

  def update 
    if @employee_leave.update(emp_params)
      redirect_to employee_leaves_path
    else  
      render 'edit'
    end

  end
  
  def destroy 
    @employee_leave.destroy 
    redirect_to employee_leaves_path
  end


  def set_employee_leave
    @employee_leave = EmployeeLeave.find(params[:id])

  end

  def emp_params

    params.require(:employee_leave).permit(:leave_id,:employee_id,:start_date,:end_date,:confirmed_by,:status,:reason)

  end
end
