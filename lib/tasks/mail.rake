namespace :mail do
  desc "Sends various emails to users"
  task :project_status => :environment do

    Project.all.each do |project|
      UserMailer.project_status(project).deliver  
 	 end
	end
end
