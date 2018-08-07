class User < ApplicationRecord
  # enum sex: {
  #     女性: 0,
  #     男性: 1
  # }
  validates :email, presence: false, length: { maximum: 255 }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 45 }
  validates :last_name, presence: true, length: { maximum: 45 }
  validates :birth, presence: true
  validates :sex, presence: true

  belongs_to :salon

  def full_name
    "#{last_name} #{first_name}"
  end

  has_secure_password
end
