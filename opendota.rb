require 'httparty'
require 'open-uri'

class ODApi
    
    include HTTParty
    base_uri 'https://www.opendota.com'


    def heroes
        self.class.get("/api/heroes")
    end


    def matches(hero_id)
        begin
            open("https://api.opendota.com/api/heroes/#{hero_id}/matches") {|f| puts f.readlines }
        rescue OpenURI::HTTPError => ex
            puts ("#{hero_id} id doesn't exist!")
        end
    end
 
    
end


opendota = ODApi.new
puts opendota.heroes
puts "--------------------------------------"
puts opendota.matches(2000)