require 'httparty'
require 'pry'

class ODApi

  include HTTParty
  base_uri 'https://www.opendota.com'


  def heroes
    self.class.get("/api/heroes")
  end


  def matches(hero_id)
    @responce = self.class.get("/api/heroes/#{hero_id}/matches") 
    check(@responce)
  end
    
  def check(responce)
    if @responce.body == "[]"
      'Exeption! Current id does not exist'
    else 
      responce.body
    end
  end

end


opendota = ODApi.new
puts opendota.heroes
puts "--------------------------------------"
puts opendota.matches(100)
puts "--------------------------------------"
puts opendota.matches(999)
