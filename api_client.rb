require 'httparty'

class ApiClient
  include HTTParty
  base_uri 'botliga.de'

  def self.post_to_api match_id, result, bot_token
    post('/api/guess', :query => {:match_id => match_id, :result => result, :token => bot_token})
  end
  
end