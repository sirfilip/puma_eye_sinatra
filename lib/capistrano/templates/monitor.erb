Eye.config do 
  logger File.expand_path('../../log/eye.log', __FILE__)
end

Eye.application 'sinatra' do 
  
  working_dir File.expand_path('../../', __FILE__)
  env 'BUNDLE_GEMFILE' => File.expand_path('../../Gemfile', __FILE__)
  
  stdall 'log/trash.log'

  process :puma do 
    stdall 'log/puma.log'
    
    start_command '/home/filip/.rvm/bin/rvm 2.1.5 do bundle exec puma -C config/puma.rb'
    restart_command "kill -USR2 {PID}"
    stop_signals [:TERM, 5.seconds, :KILL]
    
    pid_file "/home/filip/Desktop/my-app-published/shared/temp/pids/puma.pid"
    
    daemonize false
    
    check :memory, :below => 300.megabytes, :every => 30.seconds
  end

end
