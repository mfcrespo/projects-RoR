class NotificationMailer < ApplicationMailer
  default from: 'notification@mailerapp.com'
    
  def notify(user)
    @user = params[:user]
    User.all.each do |user|
      mail(to: user.email, subject: "A new user has been registered in Mailer App")
    end
  end

end
