class EmployeeDetailsController < ApplicationController
  before_action :set_employee_detail, only: [:edit, :destroy, :update]
  
  def index 
    @e= current_employee.employee_detail.nil?
    @employee_details = current_employee.employee_detail 

    @a= current_employee.address.nil?
    @addresses= current_employee.address
    
  end

  def new
    @employee_detail = EmployeeDetail.new

  end

  def edit
  end

 
  def create
    @employee_detail = current_employee.build_employee_detail(emp_params)
    respond_to do |format|
    if @employee_detail.save 
      format.html { redirect_to leaves_url, notice: "Employee detail was successfully created." }
      format.json { render :show, status: :created, location: @employee_detail }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end

  def update 
    respond_to do |format|
    if @employee_detail.update(emp_params)
      format.html { redirect_to leaves_url, notice: "Employee details was successfully updated." }
      format.json { render :show, status: :updated, location: @employee_detail }
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
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
