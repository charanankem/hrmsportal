namespace :update_records do
  desc "adding leaves"
  task create_leaves: [:environment] do
    puts "Adding leaves"
    Leave.create(name: "somename",description: "somedescription")
    puts "Task finished"
  end
end
