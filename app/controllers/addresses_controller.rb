class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :destroy, :update]
  
  def index 
    @addresses = current_employee.address
    @a= current_employee.address.nil?
  end

  def new 
    @address = Address.new
  end

  def edit
    
  end

  
  def create
    @address = current_employee.build_address(address_params)
    respond_to do |format|
    if @address.save 
      format.html { redirect_to employee_details_url, notice: "Address was successfully created." }
      format.json { render :show, status: :created, location: @address }
    else  
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @address.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
  end


  def update 
    respond_to do |format|
    if @address.update(emp_params)
      format.html { redirect_to leaves_url, notice: "Address was successfully updated." }
      format.json { render :show, status: :updated, location: @address }
    else  
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @address.errors, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end
end
 
  def destroy
    @address.destroy 
    redirect_to employee_details_path
  end


  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:door_no, :street,:city, :state,:pincode,:country,:employee_id)
  end

end
