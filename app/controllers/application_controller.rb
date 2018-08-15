class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def sign_in(user)
    session[:user_id] = user.id
  end

  def salon_sign_in(salon)
    session[:salon_id] = salon.id
  end

  def staff_sign_in(staff)
    session[:staff_id] = staff.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_salon
    @current_salon ||= Salon.find_by(id: session[:salon_id])
  end

  def current_staff
    @current_staff ||= Staff.find_by(id: session[:staff_id])
  end

  def set_user
    @user = current_user
  end

  def set_staff
    @staff = current_staff
  end
end
