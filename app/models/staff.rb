class Staff < ApplicationRecord
  belongs_to :salon
  has_many :rooms
  has_many :users, through: :rooms
  # has_many :messages

  def created_at_to_date
    self.created_at.strftime("%Y/%m/%d")
  end

  has_secure_password
end
