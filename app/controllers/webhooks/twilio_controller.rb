class Webhooks::TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(phone: params[:From])
    body = params[:Body]

    conversation = Conversation.find_or_create_by(user: user)
    conversation.messages.create(user: user, body: body)

    head :ok
  end
end
