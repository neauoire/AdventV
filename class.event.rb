class Event

	def initialize condition, encounter, reward
		@condition = condition
		@encounter = encounter
		@reward = reward
	end

	def name
		return @name
	end

	def condition
		return @condition
	end

	def encounter
		return @encounter
	end

	def reward
		return @reward
	end

end