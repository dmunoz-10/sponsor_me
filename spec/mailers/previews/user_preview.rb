# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/project_expired_notice
  def project_expired_notice
    UserMailer.with(project: Project.first).project_expired_notice
  end

end
