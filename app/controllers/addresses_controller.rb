class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :destroy, :update]
  
  def index 
    @addresses = Address.all
    @a= current_employee.address.nil?
  end

  def new 
    @address = Address.new
  end

  def edit
    
  end

  def create 
    #@address = Address.new(address_params)
    @employee_detail = current_employee.build_address(address_params)
    if @address.save 
      #render plain: @designations.inspect
      redirect_to employee_details_path
    else  
      render action: 'new'
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end

 
  def destroy
    @address.destroy 
    redirect_to employee_details_path
  end


  def update 
    
    if @address.update(address_params)
      redirect_to addresses_path
    else  
      render 'edit'
    end
  end


  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:door_no, :street,:city, :state,:pincode,:country,:employee_id)
  end

end
