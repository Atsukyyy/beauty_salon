class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def new
    @staff = Staff.new
  end

  def create
    area = Area.find(params[:staff][:area_id])
    @staff = area.staffs.build(staff_params)

    if @staff.save!
      staff_sign_in(@staff)
      flash[:success] = "ご登録ありがとうございます。"
      redirect_to root_path
    else
      flash[:danger] = "入力内容をお確かめの上、もう一度登録ボタンを押してください。"
      render 'new'
    end
  end

  private

  def staff_params
    params.require(:staf).permit(:email, :name, :password, :password_confirmation, :salon_id)
  end
end
