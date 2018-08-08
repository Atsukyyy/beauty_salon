class SalonsController < ApplicationController
  before_action :set_salon

  def index
    @salons = Salon.all
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      salon_sign_in(@salon)
      flash[:success] = "ご登録ありがとうございます。"
      redirect_to salon_path
    else
      render 'new'
    end
  end

  def show
    @salon = Salon.find_by(id: session[:salon_id])
  end

  private

  def set_salon
    @salon = current_salon
  end

  def salon_params
    params.require(:salon).permit(:email, :last_name, :name, :password, :password_confirmation, :url, :address, :phone_number)
  end

end
