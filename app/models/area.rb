class Area < ApplicationRecord
  belongs_to :prefecture, class_name: "Prefecture"
  has_many :users, class_name: "User", foreign_key: "area_id"
  has_many :salons

  validates :name, uniqueness: true

end
