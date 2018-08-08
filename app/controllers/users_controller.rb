class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
    if params[:last_name].present?
      @users = @users.get_by_name params[:last_name]
    end
    if params[:sex].present?
      @users = @users.get_by_sex params[:sex]
    end
    if params[:prefecture_id].present?
      @users = @users.get_by_prefecture_id params[:prefecture_id]
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
