class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "ご登録ありがとうございます。"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :password, :password_confirmation, :birth, :sex, :color, :hair_extension)
  end
end
