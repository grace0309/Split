class MessagesController < ApplicationController
  before_action :set_posts, only: [ :show, :new, :create ]
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message.user_id = current_user.id
    @message = Message.new(messages_params)
    @message.save
  end

  private

  def set_posts
    @post = Post.find(params[:id])
  end

  def messages_params
    params.require(:message).permit(:message_content)
  end
end
