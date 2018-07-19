# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
Person.delete_all

csv_text = File.read(Rails.root.join('db', 'seeds_data', 'seeds_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |c|

  def extract_phone_number(inputPhone)
    result = inputPhone.scan(/(\d{3})\D{0,3}(\d{3})\D{0,3}(\d{4})/).map{|e| e.join('-')}
    result = result.join(' :: ')
    result.empty? ? nil : result
  end
  def extract_date(input)
    unless !input
    date = Date.strptime(input, "%m/%d")
    @date1 = date.strftime('%B %d')
    return date
    end
  end
  t = Person.new
  t.first_name = c['first_name']
  t.last_name = c['last_name']
  t.phone = extract_phone_number(c['phone'])
  t.title = c['title']
  t.email = c['email']
  t.birthday = extract_date(c['birthday'])
  if t.save!
    puts t.first_name + " " + t.last_name + " " + t.phone.to_s + " " + t.title + " " +
    t.email + " " + t.birthday.to_s + " " + "saved!"
  else

    "Something went wrong!"

  end
end
