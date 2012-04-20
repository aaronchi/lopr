worker_processes 3
preload_app true
timeout 30

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker| 
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end