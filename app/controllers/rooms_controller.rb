class RoomsController < ApplicationController
  def index
    @rooms = Room.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @staff_id = []
    @rooms.each do |room|
      @staff_id << room.staff_id
    end
    puts "============================================================="
    puts @staff_id
    # @staffs = Staff.(staff_id)
  end

  def show
    @messages = Message.where(room_id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end
end
