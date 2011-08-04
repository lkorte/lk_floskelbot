class Guess
	def initialize
		@scores = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,5,5,6,7,8]
	end
	
	def result
		scores_home = @scores.shuffle
		scores_guest = @scores.shuffle
		result_home = scores_home[rand(scores_home.count-1)]
		result_guest = scores_guest[rand(scores_guest.count-1)]
		"#{result_home}:#{result_guest}"
	end
end