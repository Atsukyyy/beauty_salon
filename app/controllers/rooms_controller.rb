class RoomsController < ApplicationController
  def index
  end

  def show
    @messages = Message.all
  end

  def new
  end

  def create
  end

  def edit
  end
end
