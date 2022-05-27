namespace :approve_leaves do
  desc "approv leaves"
  task create_leaves: [:environment] do
    puts "Adding leaves"
    Leave.create(name: "somename",description: "somedescription")
    puts "Task finished"
  end
end
