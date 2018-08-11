class User < ApplicationRecord
  enum sex: {
    女性: 0,
    男性: 1
  }
  enum hair_style: {
    ベリーショート: 0,
    ショート: 1,
    ミディアム: 2,
    セミロング: 3,
    ロング: 4
  }

  enum hair_type: {
    直毛: 0,
    ややクセ毛: 1,
    強いクセ毛: 2
  }
  # enum prefecture_id: {
  #   北海道: 1,
  #   青森県: 2,
  #   岩手県: 3,
  #   秋田県: 4,
  #   宮城県: 5,
  #   山形県: 6,
  #   福島県: 7,
  #   茨城県: 8,
  #   栃木県: 9,
  #   群馬県: 10,
  #   埼玉県: 11,
  #   東京都: 12,
  #   神奈川県: 13,
  #   千葉県: 14,
  #   山梨県: 15,
  #   長野県: 16,
  #   新潟県: 17,
  #   富山県: 18,
  #   石川県: 19,
  #   福井県: 20,
  #   静岡県: 21,
  #   愛知県: 22,
  #   岐阜県: 23,
  #   三重県: 24,
  #   滋賀県: 25,
  #   京都府: 26,
  #   大阪府: 27,
  #   兵庫県: 28,
  #   奈良県: 29,
  #   和歌山県: 30,
  #   鳥取県: 31,
  #   島根県: 32,
  #   岡山県: 33,
  #   広島県: 34,
  #   山口県: 35,
  #   香川県: 36,
  #   愛媛県: 37,
  #   徳島県: 38,
  #   高知県: 39,
  #   福岡県: 40,
  #   佐賀県: 41,
  #   長崎県: 42,
  #   熊本県: 43,
  #   大分県: 44,
  #   宮崎県: 45,
  #   鹿児島県: 46,
  #   沖縄県: 47
  # }
  enum advertisement: {
    単なる節約のため: 0,
    モデルを目指しているため: 1
  }
  enum color: {
    可能: true,
    不可能: false
  }, _suffix: true

  enum hair_extension: {
    可能: true,
    不可能: false
  }, _suffix: true

  enum nail: {
    希望: true,
    希望しない: false
  }
  validates :email, presence: false, length: { maximum: 255 }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 45 }
  validates :last_name, presence: true, length: { maximum: 45 }
  validates :birth, presence: true
  validates :sex, presence: true

  belongs_to :prefecture, class_name: "Prefecture"
  belongs_to :area, class_name: "Area"


  # ユーザー名による絞り込み
  scope :get_by_name, ->(last_name) {
    where("last_name like ?", "%#{last_name}%")
  }
  # 年齢による絞り込み
  scope :get_by_age, ->(age_from, age_to) {
    where(age: age_from..age_to)
  }
  # 性別による絞り込み
  scope :get_by_sex, ->(sex) {
    where(sex: sex)
  }
  # 都道府県による絞り込み
  scope :get_by_prefecture_id, ->(prefecture_id) {
    where(prefecture_id: prefecture_id)
  }
  # 市町村区による絞り込み
  scope :get_by_area_id, ->(area_id) {
    where(area_id: area_id)
  }
  # カラーによる絞り込み
  scope :get_by_color, ->(color) {
    where(color: color)
  }
  # エクステによる絞り込み
  scope :get_by_hair_extension, ->(hair_extension) {
    where(hair_extension: hair_extension)
  }
  # ネイルによる絞り込み
  scope :get_by_nail, ->(nail) {
    where(nail: nail)
  }
  # 理由による絞り込み
  scope :get_by_advertisement, ->(advertisement) {
    where(advertisement: advertisement)
  }

  def full_name
    "#{last_name} #{first_name}"
  end

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birth.strftime(date_format).to_i) / 10000
  end

  def created_at_to_date
    self.created_at.strftime("%Y/%m/%d")
  end

  has_secure_password
end
