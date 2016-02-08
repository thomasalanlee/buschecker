require 'net/http'
require 'json'

class WelcomeController < ApplicationController
  def index
    url = 'http://countdown.tfl.gov.uk/stopBoard/50952/?_dc=1454931694776'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    resp = JSON.parse(response)
    @bus_times = resp[:arrivals].first[:estimatedWait]
  end
end
