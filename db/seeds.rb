# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Product.destroy_all
Item.destroy_all

csv_text = File.read(Rails.root.join("public", "products.csv"))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  p = Product.new
  p.product_name = row[1]
  p.product_image = row[2]
  p.product_description = row[3]
  p.save
  puts "#{p.product_name}, #{p.product_image} saved"
end


csv_text = File.read(Rails.root.join("public", "inventory.csv"))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  i = Item.new
  i.product_id = row[0]
  i.waist = row[1]
  i.length = row[2]
  i.style = row[3]
  i.count = row[4]
  i.save
  puts "#{i.waist}, #{i.style} saved"
end

