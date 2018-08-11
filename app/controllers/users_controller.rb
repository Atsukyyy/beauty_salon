class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.page(params[:page])

    if params[:last_name].present?
      @users = @users.get_by_name params[:last_name]
    end
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

  end

  def edit

  end

  private

  def set_user
    @user = current_user
  end
end
