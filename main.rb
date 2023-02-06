require 'net/http'
require 'uri'
require 'rexml/document'
require 'json'
require_relative 'lib/forecast'

city_codes = JSON.parse(File.read(File.join(__dir__, 'data', 'city_codes.json')))

cities = city_codes.keys

cities.each.with_index(1) { |city, index| puts "#{index}. #{city}" }

puts
print '>> '
user_input = $stdin.gets.to_i

select_city = cities[user_input - 1]

uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{city_codes[select_city]}.xml")

responce = Net::HTTP.get_response(uri)

doc = REXML::Document.new(responce.body)

forecast = doc.root.elements['REPORT/TOWN'].elements.to_a

forecast_collection = Forecast.from_xml(forecast)

puts
puts "Прогноз погоды для города: #{select_city}"

forecast_collection.each do |period|
  puts
  puts period
end
