namespace :update_leaves do
  desc "adding leaves"
  task approve_leaves: [:environment] do
    puts "checking applied leaves"
    employee_leaves=EmployeeLeafe.where("created_at < (?) and status= null",3.days.ago)
    employee_leaves.each do |el|
      el.status= "Approved"
      el.save
    end
    puts "Task finished"
  end
end
