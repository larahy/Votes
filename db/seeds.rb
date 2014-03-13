# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

data = IO.read('/Users/larahy/desktop/votes.txt')
def validate(body)
  body.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
end

Campaign.create(name: "ssss_uk_01B")
Campaign.create(name: "Emmerdale")
Campaign.create(name: "ssss_uk_02A")
Campaign.create(name: "ssss_uk_02B")

csv_file = CSV.new(validate(data), {:col_sep => " "})
csv_file.to_a.map  do |data| 
  if data[2].split(':')[1] == "ssss_uk_01B"
    Vote.create(validity: data[3].split(':')[1], choice: data[4].split(':')[1], campaign_id: 1)
  elsif data[2].split(':')[1] == "Emmerdale"
    Vote.create(validity: data[3].split(':')[1], choice: data[4].split(':')[1], campaign_id: 2)
  elsif data[2].split(':')[1] == "ssss_uk_02A"
    Vote.create(validity: data[3].split(':')[1], choice: data[4].split(':')[1], campaign_id: 3)
  elsif data[2].split(':')[1] == "ssss_uk_02B"
    Vote.create(validity: data[3].split(':')[1], choice: data[4].split(':')[1], campaign_id: 4)
  end
end