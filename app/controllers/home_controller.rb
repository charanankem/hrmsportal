class HomeController < ApplicationController
  
  def index
  end
  def landing
    @last_five_loginloguts= current_employee.attendances.last(5)
  end


end
