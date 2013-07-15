class ProjectMailer < ActionMailer::Base
  default from: 'prachibhawre@gmail.com'
  
  def send_invitation_for_project(project, email)
    @project = project
    
    mail(
      to: email,
      from: 'prachibhawre@gmail.com',
      subject: 'Invitation for project on Artisania' 
    )
  end
  
end