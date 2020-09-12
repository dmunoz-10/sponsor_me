# frozen_string_literal: true

# ExpireProject Job
class ExpireProjectJob < ApplicationJob
  queue_as :default

  def perform(project)
    @project = project
    return if project_already_inactive?

    @project.update!(status: 'inactive')

    UserMailer.with(project: @project).project_expired_notice.deliver_later
  end

  private

  def project_already_inactive?
    @project.status == 'inactive'
  end
end
