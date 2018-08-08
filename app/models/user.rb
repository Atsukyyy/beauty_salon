class User < ApplicationRecord
  enum sex: {
    女性: 0,
    男性: 1
  }
  enum prefecture_id: {
    東京都: 1,
    神奈川県: 2
  }
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


  # ユーザー名による絞り込み
  scope :get_by_name, ->(last_name) {
    where("last_name like ?", "%#{last_name}%")
  }
  # 性別による絞り込み
  scope :get_by_sex, ->(sex) {
    where(sex: sex)
  }
  # 都道府県による絞り込み
  scope :get_by_prefecture_id, ->(prefecture_id) {
    where(prefecture_id: prefecture_id)
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
