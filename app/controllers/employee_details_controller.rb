class EmployeeDetailsController < ApplicationController
  before_action :set_employee_detail, only: [:edit, :destroy, :update]
  
  def index 
    @e= current_employee.employee_detail.nil?
    @employee_details = EmployeeDetail.all 

    @a= current_employee.address.nil?
    @addresses= Address.all
    
  end

  def new
    @employee_detail = EmployeeDetail.new

  end

  def edit
  end

  def create 
    @employee_detail = current_employee.build_employee_detail(emp_params)
    if @employee_detail.save 
      redirect_to employee_details_path
    else  
      puts @employee_detail.errors.inpsect
      render 'new'
    end
  end

  def update 
    if @employee_detail.update(emp_params)
      redirect_to employee_details_path
    else  
      render 'edit'
    end

  end
  
  def destroy 
    @employee_detail.destroy 
    redirect_to employee_details_path
  end


  def set_employee_detail
    @employee_detail = EmployeeDetail.find(params[:id])

  end

  def emp_params

    params.require(:employee_detail).permit(:contact_no, :emergency_contact_no, :designation_id,:employee_id,:manager_id,:blood_group,:work_experience)

  end
end
