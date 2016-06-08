class AdventV

	def initialize

		@memory = loadMemory
		@locationId = @memory["location"].to_i
		@location = $world.location(@locationId)
		@item = $world.item(@memory["item"])
		@hp = @memory["hp"].to_i
		@day = @memory["day"].to_i
		@lastCommand = @memory["lastCommand"]
		@lastMaster = @memory["lastMaster"]
		
	end

	#

	def loadMemory

		memoryFilePath = "#{$jiin_path}/disk/auto.adventv/memory.txt"
		memory = File.read(memoryFilePath)
		return JSON.parse(memory)

	end

	def saveMemory

		memoryFilePath = "#{$jiin_path}/disk/auto.adventv/memory.txt"
		newMemory = {}
		newMemory["hp"] = @hp
		newMemory["location"] = @locationId
		if item then newMemory["item"] = item.name end
		if !item then newMemory["item"] = "none" end
		newMemory["day"] = @day
		newMemory["lastMaster"] = @lastMaster
		newMemory["lastCommand"] = @lastCommand
		File.open(memoryFilePath, 'w') { |file| file.write(newMemory.to_json) }

	end

	def debug

		return "==========\nHEALTH   : #{hp}\nLOCATION : #{location.name}\nITEM     : #{item.name}\nDAY      : #{day}\nOPTION 1 : "+(locations[0] ? locations[0].name : "")+"\nOPTION 2 : "+(locations[1] ? locations[1].name : "")+"\nOPTION 3 : "+(locations[2] ? locations[2].name : "")+"\n=========="

	end

	#

	def setHp newHp
		@hp = newHp
	end

	def setLocationId newLocationId
		@locationId = newLocationId
	end

	def setItem newItem
		@item = newItem
	end

	def setLastCommand newLastCommand
		@lastCommand = newLastCommand
	end

	def setLastMaster newLastMaster
		@lastMaster = newLastMaster
	end

	def setDay newDay
		@day = newDay
	end


	#

	def item
		if @item then return @item end
		return
	end

	def hp
		return @hp
	end

	def lastCommand
		return @lastCommand
	end

	def day
		return @day
	end

	def location
		return @location
	end

	def locationId
		return @locationId
	end

	def locations
		return {1 => $world.location(@locationId+1),2 => $world.location(@locationId+2),3 => $world.location(@locationId+3)}
	end

	#

	def health
		if @hp > 0 then return hp end
		return "0"
	end

	def inventory
		if @item then return item.power end
	end

	#

	def findEvent

		possibleEvents = []
		# Look for conditional event
		@location.events.each do |event|
			if item && event.condition == item.name then possibleEvents.push(event)
			elsif event.condition.to_i > 0 == event.condition.to_i >= hp then possibleEvents.push(event) end
		end
		# Look for normal event
		@location.events.each do |event|
			if event.condition then next end
			possibleEvents.push(event)
		end
		return possibleEvents.sample
	end

	def move location
		@location = location
	end

	def echo

		tweet = ""
		tweet += print_event+"\n"
		tweet += print_destinations+"\n"
		tweet += print_day

		return tweet

	end

	def print_event

		if @day == 1 then return "Resting at the Tavern, feeling respawned." end

		event = findEvent
		resolve = ""

		itemPower = 0
		if item then itemPower = item.power.to_i end

		# Resolve
		if event.encounter.power > 0
			hpMod = event.encounter.power - itemPower
			if hpMod == 0 then
				resolve = "my #{@item.name} broke"
				@item = nil
			elsif hpMod < 1
				hpMod = 0
			else
				setHp(@hp - hpMod)
				resolve = "lost #{hpMod}hp"
			end
		elsif event.encounter.power < 0
			beforeHp = @hp
			afterHp = @hp + (event.encounter.power * -1)
			if afterHp > 10 then afterHp = 10 end
			if afterHp != beforeHp 
				setHp(afterHp)
				resolve = "I gained #{(event.encounter.power * -1)}hp"
			end
		end

		# Reward
		if @hp > 0 && event.reward
			if !item || event.reward.power > item.power
				@item = event.reward
				reward = "got a #{@item.name}"
			end
		end

		if resolve != "" && reward
			resolve += " and "+reward
		elsif reward
			resolve = reward
		end

		if resolve == "" then resolve = "nothing happened" end

		return "#{event.encounter.action.capitalize} the #{location.name}, #{resolve}."

	end

	def print_destinations

		if $world.location(@locationId+1).name == location.name
			return "Go to the #{$world.location(@locationId+2).name.capitalize} or the #{$world.location(@locationId+3).name.capitalize}?"
		elsif $world.location(@locationId+2).name == location.name
			return "Go to the #{$world.location(@locationId+1).name.capitalize} or the #{$world.location(@locationId+3).name.capitalize}?"
		end			
		return "Go to the #{$world.location(@locationId+1).name.capitalize} or the #{$world.location(@locationId+2).name.capitalize}?"

	end

	def print_day
		return "Day#{day} Atk#{inventory} Def#{health}, via @#{@lastMaster}"
	end

end