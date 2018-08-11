# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Region.create(name: '北海道地方')
Region.create(name: '東北地方')
Region.create(name: '関東地方')
Region.create(name: '中部地方')
Region.create(name: '近畿地方')
Region.create(name: '中国地方')
Region.create(name: '四国地方')
Region.create(name: '九州・沖縄地方')

Region.find(1).prefectures.create(name: '北海道')
Region.find(2).prefectures.create(name: '青森県')
Region.find(2).prefectures.create(name: '岩手県')
Region.find(2).prefectures.create(name: '秋田県')
Region.find(2).prefectures.create(name: '宮城県')
Region.find(2).prefectures.create(name: '山形県')
Region.find(2).prefectures.create(name: '福島県')
Region.find(3).prefectures.create(name: '茨城県')
Region.find(3).prefectures.create(name: '栃木県')
Region.find(3).prefectures.create(name: '群馬県')
Region.find(3).prefectures.create(name: '埼玉県')
Region.find(3).prefectures.create(name: '東京都')
Region.find(3).prefectures.create(name: '神奈川県')
Region.find(3).prefectures.create(name: '千葉県')
Region.find(4).prefectures.create(name: '山梨県')
Region.find(4).prefectures.create(name: '長野県')
Region.find(4).prefectures.create(name: '新潟県')
Region.find(4).prefectures.create(name: '富山県')
Region.find(4).prefectures.create(name: '石川県')
Region.find(4).prefectures.create(name: '福井県')
Region.find(4).prefectures.create(name: '静岡県')
Region.find(4).prefectures.create(name: '愛知県')
Region.find(4).prefectures.create(name: '岐阜県')
Region.find(4).prefectures.create(name: '三重県')
Region.find(5).prefectures.create(name: '滋賀県')
Region.find(5).prefectures.create(name: '京都府')
Region.find(5).prefectures.create(name: '大阪府')
Region.find(5).prefectures.create(name: '兵庫県')
Region.find(5).prefectures.create(name: '奈良県')
Region.find(5).prefectures.create(name: '和歌山県')
Region.find(6).prefectures.create(name: '鳥取県')
Region.find(6).prefectures.create(name: '島根県')
Region.find(6).prefectures.create(name: '岡山県')
Region.find(6).prefectures.create(name: '広島県')
Region.find(6).prefectures.create(name: '山口県')
Region.find(7).prefectures.create(name: '香川県')
Region.find(7).prefectures.create(name: '愛媛県')
Region.find(7).prefectures.create(name: '徳島県')
Region.find(7).prefectures.create(name: '高知県')
Region.find(8).prefectures.create(name: '福岡県')
Region.find(8).prefectures.create(name: '佐賀県')
Region.find(8).prefectures.create(name: '長崎県')
Region.find(8).prefectures.create(name: '熊本県')
Region.find(8).prefectures.create(name: '大分県')
Region.find(8).prefectures.create(name: '宮崎県')
Region.find(8).prefectures.create(name: '鹿児島県')
Region.find(8).prefectures.create(name: '沖縄県')

require "csv"
range = 1..47
range.each{|num|
  CSV.foreach('db/areas.csv') do |row|
    Prefecture.find(num).areas.create(name: row[num-1])
  end
}

Salon.create(name: "青森サロン", password_digest: "aaaaaa", address: "青森県・・・・ビル３階", url: "localhost:3000/", email: "aomori@a.a", phone_number: "090-0000-0000", area_id: 2)

Salon.find(1).staffs.create(name: "青森太郎", email: "aomori@s.s", password_digest: "aaaaaa")
Salon.find(1).staffs.create(name: "青森次郎", email: "jaomori@s.s", password_digest: "aaaaaa")
Salon.find(1).staffs.create(name: "青森三郎", email: "saomori@s.s", password_digest: "aaaaaa")
