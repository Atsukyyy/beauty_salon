class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def sign_in(user)
    session[:user_id] = user.id
  end

  def salon_sign_in(salon)
    session[:salon_id] = salon.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_salon
    @current_salon ||= Salon.find_by(id: session[:salon_id])
  end
end
