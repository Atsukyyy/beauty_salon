class Message < ApplicationRecord
  belongs_to :staff, class_name: "Staff"
  belongs_to :user, class_name: "User"
  # belongs_to :user
  # belongs_to :staff
  belongs_to :room
  after_create_commit { MessageBroadcastJob.perform_later self }
end
