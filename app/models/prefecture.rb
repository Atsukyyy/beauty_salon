class Prefecture < ApplicationRecord
  belongs_to :region, class_name: "Region"

  # has_many :areas
  has_many :users, class_name: "User", foreign_key: "prefecture_id" # , through: :areas


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

  def self.select_options
    all.map { |pref| [pref.name, pref.id ] }
  end

  def self.areas_clubs
    all.preload(areas: :clubs).map do |prefecture|
      prefecture.as_json(only: %w[id name slug]).merge(
        areas: prefecture.areas.map { |area|
          area.as_json(only: %w[id slug name name_shortened]).merge(
            clubs: area.clubs.map { |club| club.as_json(only: %w[id name]) }
          )
        }
      )
    end
  end

  def self.areas
    all.preload(:areas).map do |prefecture|
      prefecture.as_json(only: %w[id name slug]).merge(
        areas: prefecture.areas.map { |area| area.as_json(only: %w[id slug name name_shortened]) }
      )
    end
  end

  def with_suffix
    case slug.to_sym
    when :hokkaido
      '北海道'
    when :kyoto
      '京都府'
    when :osaka
      '大阪府'
    when :tokyo
      '東京都'
    else
      "#{name}県"
    end
  end

end
