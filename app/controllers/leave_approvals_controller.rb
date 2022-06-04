class LeaveApprovalsController < ApplicationController
  def approvalindex
    @leaveapprovals=EmployeeLeave.all
  end
end
