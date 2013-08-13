# coding: utf-8

require 'phrase'

class Guess
  MAX_SCORE = 4
  
  def initialize
    @chars = ('a'..'z').to_a
    @chars.concat ['ä','ö','ü','ß']
    @chars.concat ('0'..'9').to_a
  end

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