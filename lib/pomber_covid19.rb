require "pomber_covid19/version"
require "HTTParty"

module PomberCovid19
  BASE_URL = "https://pomber.github.io/covid19/timeseries.json"

  def self.find_by_region_name(region_name)
    response = HTTParty.get(BASE_URL)
    response[region_name.capitalize]
  end
end