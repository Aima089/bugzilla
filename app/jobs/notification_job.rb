class NotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id, action)
    user = User.find(user_id)
    NotificationMailer.action_notification(user, action).deliver_now
  end
end
