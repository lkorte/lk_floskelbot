#!/usr/bin/env ruby
$:.unshift File.dirname(__FILE__)

require 'yaml'
require 'mongoid'
require 'match'
require 'guess'
require 'api_client'

Mongoid.database = Mongo::Connection.new('localhost','27017').db('botliga')

token_list = YAML.load_file('tokens.yml')
bot_token = token_list['bot2']

(1..34).each do |group|
	matches = Match.where(:group => group)
	
	matches.each do |match|
		guess = Guess.new
		result = guess.result
		puts "#{group} #{match.matchId} #{match.hostName} - #{match.guestName}, #{match.hostGoals}:#{match.guestGoals}, guess: #{result}"
		ApiClient.post_to_api(match.matchId, result, bot_token)
	end
	puts 
	puts "----------------------------------------------------------------------"
	puts
end