class Prefecture < ApplicationRecord
  # belongs_to :region, class_name: "Region"

  has_many :areas, class_name: "Area", foreign_key: "prefecture_id"
  # has_many :users, through: :Areas


  # enum region_id: {
  #   北海道地方: 1,
  #   東北地方: 2,
  #   関東地方: 3,
  #   中部地方: 4,
  #   近畿地方: 5,
  #   中国地方: 6,
  #   四国地方: 7,
  #   九州・沖縄地方: 8
  # }
end
