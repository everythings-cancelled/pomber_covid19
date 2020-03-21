require "httparty"
require "pry"
module PomberCovid19
    class Region
        def self.find_by_name(name)
            # only let first character be capitalized
            # TODO: cache these requests
            result = HTTParty.get(BASE_URL)
            result[name.capitalize]
        end
    end
end