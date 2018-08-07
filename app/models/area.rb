class Area < ApplicationRecord
  belongs_to :prefecture
  has_many :users

  validates :name, uniqueness: true
  validates :name_shortened, length: { maximum: 10 }

  def self.active
    joins(:prefecture).merge(Prefecture.where(visible: true))
  end

end
