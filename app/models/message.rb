class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create :send_sms
  def send_sms
    return if user == conversation.user

    TwilioClient.new.send_text(conversation.user, body)
  end
end
