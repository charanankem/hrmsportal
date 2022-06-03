class EmployeesController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :update]
  
  def index 
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).page(params[:page])
  end

  def show 
    redirect_to employees_path
  end

  def new
    @employee = Employee.new
  end

  def edit
  end


  def create
    @employee = Employee.new(user_params)
    respond_to do |format|
    if @employee.save 
      format.html { redirect_to employees_url, notice: "Employee was successfully created." }
      format.json { render :show, status: :created, location: @employee }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @employee.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end

  def update 
    respond_to do |format|
    if @employee.update(user_params)
      format.html { redirect_to leaves_url, notice: "Employee was successfully updated." }
      format.json { render :show, status: :updated, location: @employee }
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @employee.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
end
  
  def destroy 
    @employee.delete 
    redirect_to employees_path,notice: 'Student has been deleted successfully'
  end

  private 

  def set_user
    @employee = Employee.find(params[:id])
  end

  def user_params
    params.require(:employee).permit(:first_name, :last_name, :employee_unique_id,:role_id,:email, :password)
  end
end
