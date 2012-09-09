#!/usr/bin/env ruby
# coding: utf-8

$:.unshift File.dirname(__FILE__)

require 'yaml'
require 'mongoid'
require 'match'
require 'guess'
require 'api_client'

Mongoid.load!("mongoid.yml", :development)

token_list = YAML.load_file('tokens.yml')
bot_token = token_list['bot2']

(1..34).each do |group|
	matches = Match.where(:group => group).order_by([:matchId, :asc])
	
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