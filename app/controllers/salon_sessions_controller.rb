class SalonSessionsController < ApplicationController

  def new
    if current_salon
      redirect_to root_path, flash: { danger: '既にログインしています。'}
    end
  end

  def create
    salon = Salon.find_by(email: params[:email])
    if salon && salon.authenticate(params[:password])
      salon_sign_in(salon)
      flash[:success] = "ログインしました。"
      redirect_to salon_path
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'new'
    end
  end

  def destroy
    session.delete(:salon_id)
    flash[:success] = "ログアウトしました。"
    redirect_to root_path
  end
end
