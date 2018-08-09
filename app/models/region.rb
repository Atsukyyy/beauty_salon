class Region < ApplicationRecord
  has_many :prefectures, class_name: "Prefecture", foreign_key: "region_id" 
  # has_many :areas, through: :prefectures
  has_many :users, through: :prefectures

  validates :name, uniqueness: true

  class << self
    def kanto
      find_by!(slug: 'kanto')
    end

    def shutoken
      find_by!(slug: 'shutoken')
    end

    def active
      where(id: Prefecture.where(visible: 1).pluck(:region_id).uniq)
    end

    def area_json
      output = {}
      all.each do |region|
        prefecture_output = {}
        region.prefectures.each do |prefecture|
          area_output = {}

          prefecture.areas.each do |area|
            area_output[area.name] = area.id
          end

          prefecture_output[prefecture.name] = area_output
        end
        output[region.name] = prefecture_output
      end
      output.to_json
    end

    def prefectures_areas
      all.preload(prefectures: :areas).map do |region|
        region.as_json(only: %w[id name slug]).merge(
          prefectures: region.prefectures.order(priority_in_region: :desc, id: :asc).map { |prefecture|
            prefecture.as_json(only: %w[id slug name name_shortened]).merge(
              areas: prefecture.areas.map { |area| area.as_json(only: %w[id name name_shortened]) }
            )
          }
        )
      end
    end

    def prefectures_areas_active
      active.preload(prefectures: :areas).map do |region|
        region.as_json(only: %w[id name slug]).merge(
          prefectures: region.prefectures.visible.order(priority_in_region: :desc, id: :asc).map { |prefecture|
            prefecture.as_json(only: %w[id slug name name_shortened]).merge(
              areas: prefecture.areas.map { |area| area.as_json(only: %w[id name name_shortened]) }
            )
          }
        )
      end
    end
  end
end
