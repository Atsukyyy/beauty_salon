class Message < ApplicationRecord
  belongs_to :user
  belongs_to :staff
  belongs_to :room
end
