class MessagesController < ApplicationController
  before_action :set_posts, only: [ :index, :show, :new, :create ]
  def index
    @messages = Message.all
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)
    @message.post = @post
    @message.user_id = current_user.id
    if @message.save
      respond_to do |format|
        format.html { redirect_to post_messages_path(@post) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/form' }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_posts
    @post = Post.find(params[:post_id])
  end

  def messages_params
    params.require(:message).permit(:message_content)
  end
end
