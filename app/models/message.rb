class Message < ApplicationRecord
  # belongs_to :user
  # belongs_to :staff
  # belongs_to :room
  after_create_commit { MessageBroadcastJob.perform_later self }
end
