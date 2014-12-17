require 'erb'

namespace :eye do 

  desc "setup eye files"
  task :setup do 
    on roles(:app) do
      template_path = File.expand_path('../../templates/monitor.erb', __FILE__)
      template = ERB.new(File.read(template_path)).result(binding)
      destination = "#{current_path}/config/monitor.eye"
      upload! StringIO.new(template), destination
    end 
  end

  desc "loads the eye configuration"
  task :load do 
    on roles(:app) do 
      within current_path do 
        execute :bundle, "exec eye load #{current_path}/config/monitor.eye"
      end
    end
  end
  
  desc "restarts puma"
  task :restart => :load do 
    on roles (:app) do 
      within current_path do 
        if test "[ -f #{shared_path}/temp/pids/puma.pid ]"
          execute :bundle, "exec eye restart puma"
        else
          execute :bundle, "exec eye start puma"
        end
      end
    end
  end
  
  desc "stops puma"
  task :stop => :load do 
    on roles (:app) do 
      within current_path do     
        execute :bundle, "exec eye stop puma"
      end
    end
  end
  
  desc "starts puma"
  task :start => :load do 
    on roles (:app) do 
      within current_path do     
        execute :bundle, "exec eye start puma"
      end
    end
  end

  desc "get eye info"
  task :info => :load do 
    on roles(:app) do 
      within current_path do 
        capture :bundle, "exec eye info"
      end
    end
  end

  after 'deploy:finished', 'eye:restart'
end
