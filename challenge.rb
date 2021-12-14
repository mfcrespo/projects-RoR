require 'net/http'
require 'uri'
require 'json'

uri = URI('https://coderbyte.com/api/challenges/json/age-counting')
response = Net::HTTP.get(uri)
puts response
