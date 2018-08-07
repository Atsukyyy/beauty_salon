class Prefecture < ApplicationRecord
  belongs_to :region

  has_many :areas
  has_many :users, through: :areas
  validates :name, uniqueness: true
  scope :visible, -> { where(visible: true) }

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
