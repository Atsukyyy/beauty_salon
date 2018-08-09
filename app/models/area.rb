class Area < ApplicationRecord
  belongs_to :prefecture
  has_many :users, class_name: "User", foreign_key: "prefecture_id"

  validates :name, uniqueness: true

end
