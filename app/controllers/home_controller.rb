class HomeController < ApplicationController
  
  def index
  end
  def landing
    @last_five=current_employee.attendances.last(5)
    @hldys= Holiday.all
    @lvs = Leave.all
  end
  

end
