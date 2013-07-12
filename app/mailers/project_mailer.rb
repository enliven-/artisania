class ProjectMailer < MailerBase
  
  def send_invitation_for_project(project, email)
    @project = project
    mail(
      to: email,
      from: ARTISAN_FROM
      subject: 'Invitation for project on Artisania' 
    )
  end
  
end