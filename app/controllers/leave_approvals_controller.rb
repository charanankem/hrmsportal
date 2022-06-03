class LeaveApprovalsController < ApplicationController
  def approvalindex
    @leaveapprovals=EmployeeLeafe.all
  end
end
