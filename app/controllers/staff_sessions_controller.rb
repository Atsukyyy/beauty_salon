class StaffSessionsController < ApplicationController

  def new
    if current_staff
      redirect_to root_path, flash: { danger: '既にログインしています。'}
    end
  end

  def create
    @staff = Staff.find_by(email: params[:email])
    if @staff && @staff.authenticate(params[:password])
      staff_sign_in(@staff)
      flash[:success] = "ログインしました。"
      redirect_to @staff
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'new'
    end
  end

  def destroy
    session.delete(:staff_id)
    flash[:success] = "ログアウトしました。"
    redirect_to root_path
  end
end
