class NotificationMailer < ApplicationMailer
    default from: 'notifications@example.com'
  
    def action_notification(user, action)
      @user = user
      @action = action
      mail(to: @user.email, subject: "Important Action: #{@action}")
    end
  end
  