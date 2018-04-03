#!/usr/bin/ruby

# M.Kling
# 2018-03-21

require 'net/http'
require 'json'

puts "Powered by Dark Sky https://darksky.net/poweredby/"


uri = URI('https://api.darksky.net/forecast/24e49568dfbb460cc504010a5ac8d122/37.8267,-122.4233?exclude=minutely,hourly,daily,alerts,flags')




def get_weather_hash(uri)
  Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    request = Net::HTTP::Get.new uri
    
    response = http.request request
    
    JSON::parse!(response.body)
  end
end


output = get_weather_hash(uri)
p output["summary"]