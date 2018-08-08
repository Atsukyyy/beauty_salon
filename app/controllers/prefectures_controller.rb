class PrefecturesController < ApplicationController

  def tokyo
    @users = User.where(prefecture_id: 1)
  end

  private

end
