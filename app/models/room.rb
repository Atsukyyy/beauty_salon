class Room < ApplicationRecord
  belongs_to :staff
  belongs_to :user
  has_many :messages
end
