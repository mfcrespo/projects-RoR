class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @user = User.new
    NotificationMailer.with(@user).notify(@user)
  end
end
