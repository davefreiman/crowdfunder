class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_pledge(pledge)
    @pledge = pledge
    @project = @pledge.project
    @user = @project.user
    @backer = @pledge.user

    mail(:to => @user.email, :subject => "Your project received some backing on CrowdFunder.")
  end

  def project_status(project)
    @project = project
    @user = @project.user
    mail(:to => @user.email, :subject => "#{@project.title} Status Update")
  end

  
end
