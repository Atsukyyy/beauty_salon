class RegistrationsController < ApplicationController

  def new
    @user = User.new

  end

  def create


    prefecture = Prefecture.find_by(name: params[:user][:prefecture_id])

    @user = prefecture.users.build(user_params)
    # @user = User.new(user_params)

    if @user.save!

      sign_in(@user)
      flash[:success] = "ご登録ありがとうございます。"
      redirect_to root_path
    else
      flash[:danger] = "入力内容をお確かめの上、もう一度登録ボタンを押してください。"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :password, :password_confirmation, :birth, :sex, :color, :hair_extension, :nail, :advertisement, :prefecture_id, :hair_type)
  end
end
