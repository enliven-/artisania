class ProjectMailer < ActionMailer::Base
  default from: 'artisania.help@gmail.com'
  
  def send_invitation_for_project(project, email)
    @project = project
    
    mail(
      to: email,
      from: 'artisania.help@gmail.com',
      subject: 'Invitation for project on Artisania' 
    )
  end
  
end