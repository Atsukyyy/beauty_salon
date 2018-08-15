class UsersController < ApplicationController
  before_action :set_user
  before_action :sign_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page])

    if params[:last_name].present?
      @users = @users.get_by_name params[:last_name]
    end
    if params[:age_from].present? && params[:age_to].present?
      if params[:age_from].present? && params[:age_to].present?
        if params[:age_from] < params[:age_to]
          @users = @users.get_by_age(params[:age_from], params[:age_to])
        else
          @users = @users.get_by_age(params[:age_to], params[:age_from])
        end
      elsif params[:age_from].present? && params[:age_to].empty?
        flash.now[:danger] = "年齢欄を使用するときは両方に値を入力してください。"
        render 'index'
      elsif params[:age_from].empty? && params[:age_to].present?
        flash.now[:danger] = "年齢欄を使用するときは両方に値を入力してください。"
        render 'index'
      end
    end
    if params[:sex].present?
      @users = @users.get_by_sex params[:sex]
    end
    if params[:prefecture_id].present?
      @users = @users.get_by_prefecture_id params[:prefecture_id]
    end
    if params[:area_id].present?
      @users = @users.get_by_area_id params[:area_id]
    end
    if params[:color].present?
      @users = @users.get_by_color params[:color]
    end
    if params[:hair_extension].present?
      @users = @users.get_by_hair_extension params[:hair_extension]
    end
    if params[:nail].present?
      @users = @users.get_by_nail params[:nail]
    end
    if params[:advertisement].present?
      @users = @users.get_by_advertisement params[:advertisement]
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = current_user
  end

  # ログイン済みユーザーかどうか確認
  def sign_in_user
    unless signed_in?
      flash[:danger] = "Please log in."
      redirect_to sign_in_path
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :password, :password_confirmation, :birth, :sex, :color, :hair_extension, :nail, :advertisement, :prefecture_id, :hair_type, :area_id, :hair_style)
  end
end
