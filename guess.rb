# coding: utf-8

require 'phrase'

class Guess
  MAX_SCORE = 3
  
	def initialize
		@scores = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,5]
    @chars = ('a'..'z').to_a
    @chars.concat ['ä','ö','ü','ß']
    @chars.concat ('0'..'9').to_a
	end
	
	# def result
	#     scores_home = @scores.shuffle
	#     scores_guest = @scores.shuffle
	#     result_home = scores_home[rand(scores_home.count-1)]
	#     result_guest = scores_guest[rand(scores_guest.count-1)]
	#     "#{result_home}:#{result_guest}"
	#   end
  
  def result
    score_home = score_from_phrase
    score_guest = score_from_phrase
    "#{score_home}:#{score_guest}"
  end
  
  private
  
  def score_from_phrase
    begin
      phrase = Phrase.skip(Random.rand(1..Phrase.count)).limit(1).first.text
      checksum = 0
      arr_phrase = phrase.downcase.chars.to_a
      arr_phrase.reject!{|e| !(/([a-z]|[äöüß]|[0-9])/.match e)}
      arr_phrase.each do |e|
        checksum += @chars.index e
      end
      score = checksum % (MAX_SCORE + 1)
    rescue 
      0
    end
  end
  
end