class TeamsController < ApplicationController
  def teamindex
    @emplo=EmployeeDetail.where(manager_id: "0").all
    
  

  end
  
end
