class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path, flash: { danger: '既にログインしています。'}
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      flash[:success] = "ログインしました。"
      redirect_to user_path
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "ログアウトしました。"
    redirect_to root_path
  end
end
