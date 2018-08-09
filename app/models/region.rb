class Region < ApplicationRecord
  # has_many :prefectures, class_name: "Prefecture", foreign_key: "region_id"
  # has_many :areas, through: :prefectures
  # has_many :users, through: :prefectures

  validates :name, uniqueness: true

end
