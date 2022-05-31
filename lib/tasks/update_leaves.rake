namespace :update_leaves do
  desc "adding leaves"
  task approve_leaves: [:environment] do
    puts "checking applied leaves"
    puts "#{Leave.all}"
    puts "Task finished"
  end
end
