class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
  

    User.all.each do |user|
      NotificationMailer.with(@user).notify(@user).deliver_later
    end
  end
end
