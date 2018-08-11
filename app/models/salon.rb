class Salon < ApplicationRecord
  has_many :users
  has_many :staffs
  belongs_to :area

  has_secure_password
end
