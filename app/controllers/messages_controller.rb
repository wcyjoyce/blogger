class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @message = Message.new
    # authorize @message
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    if @message.save
      redirect_to about_path, notice: "Thanks for leaving a message, I will get back to you shortly!"
    else
      redirect_to about_path, alert: "There was a problem with your message. Please try again."
    end
  end

  def show
    @messages = Message.order(created_at: :desc)
    authorize @messages
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :message)
  end
end
