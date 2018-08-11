class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    Room.create()
    @message = Message.new
  end

  def create
    @room = Room.create(user_id: params[:id], staff_id: session[:staff_id])
    @message = @room.messages.build(message_params)

    if @message.save!
      flash[:success] = "送信されました。"
      redirect_to root_path
    else
      flash[:danger] = "入力内容をお確かめの上、もう一度登録ボタンを押してください。"
      render 'new'
    end
  end

  def edit
  end

  private

  def message_params
    params.require(:message).permit(:context)
  end

end
