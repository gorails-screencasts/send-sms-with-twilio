class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    @message = @conversation.messages.new message_params
    @message.user = current_user

    if @message.save
      redirect_to @conversation, notice: "Message saved successfully"
    else
      redirect_to @conversation, alert: "Unable to save message"
    end

  end

  private

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
