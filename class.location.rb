class Location

	def initialize name
		@name = name
		@events = []
		@picture = false
	end

	def name
		return @name
	end

	def addEvent event
		events.push(event)
	end

	def events
		return @events
	end

	def addPicture
		@picture = true
	end

	def hasPicture
		if @picture == true then return true end
		return
	end

end