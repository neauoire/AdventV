def locationParser locationId

	# Act 3

	if locationId % 21 == 0 then return "portal" end
	if locationId % 20 == 0 then return "trench" end
	if locationId % 19 == 0 then return "abyss" end
	if locationId % 18 == 0 then return "fountain" end
	if locationId % 17 == 0 then return "mines" end
	if locationId % 16 == 0 then return "fortress" end
	if locationId % 15 == 0 then return "necropolis" end

	# Act 2

	if locationId % 14 == 0 then return "crossroad" end
	if locationId % 13 == 0 then return "crypt" end
	if locationId % 12 == 0 then return "dunes" end
	if locationId % 11 == 0 then return "monolith" end
	if locationId % 10 == 0 then return "valley" end
	if locationId % 9 == 0 then return "tower" end
	if locationId % 8 == 0 then return "maze" end

	# Act 1

	if locationId % 7 == 0 then return "camp" end
	if locationId % 6 == 0 then return "cave" end
	if locationId % 5 == 0 then return "swamp" end
	if locationId % 4 == 0 then return "lake" end
	if locationId % 3 == 0 then return "forest" end
	if locationId % 2 == 0 then return "castle" end
	if locationId % 1 == 0 then return "tavern" end

end

def eventFormat

	if locationParser(@memory['location'].to_i) == "portal" then return locationPortal end
	if locationParser(@memory['location'].to_i) == "trench" then return locationTrench end
	if locationParser(@memory['location'].to_i) == "abyss" then return locationAbyss end
	if locationParser(@memory['location'].to_i) == "fountain" then return locationFountain end
	if locationParser(@memory['location'].to_i) == "mines" then return locationMines end
	if locationParser(@memory['location'].to_i) == "fortress" then return locationFortress end
	if locationParser(@memory['location'].to_i) == "necropolis" then return locationNecropolis end

	if locationParser(@memory['location'].to_i) == "crossroad" then return locationCrossroad end
	if locationParser(@memory['location'].to_i) == "crypt" then return locationCrypt end
	if locationParser(@memory['location'].to_i) == "dunes" then return locationDunes end
	if locationParser(@memory['location'].to_i) == "monolith" then return locationMonolith end
	if locationParser(@memory['location'].to_i) == "valley" then return locationValley end
	if locationParser(@memory['location'].to_i) == "tower" then return locationTower end
	if locationParser(@memory['location'].to_i) == "maze" then return locationMaze end
	
	if locationParser(@memory['location'].to_i) == "camp" then return locationCamp end
	if locationParser(@memory['location'].to_i) == "cave" then return locationCave end
	if locationParser(@memory['location'].to_i) == "swamp" then return locationSwamp end
	if locationParser(@memory['location'].to_i) == "lake" then return locationLake end
	if locationParser(@memory['location'].to_i) == "forest" then return locationForest end
	if locationParser(@memory['location'].to_i) == "castle" then return locationCastle end
	if locationParser(@memory['location'].to_i) == "tavern" then return locationTavern end

	return ""

end

def locationFormat

	if @memory['item'].to_i != "none"
		return "At the "+locationParser(@memory['location'].to_i).to_s+" with a "+@memory['item']+" and "+@memory['hp'].to_s+"HP."
	end

	return "At the "+locationParser(@memory['location'].to_i)+" with "+@memory['hp'].to_s+"HP."

end

def destinationFormat

	if @memory['hp'].to_i < 1 then return "I am dead and will be reborn. " end

	if locationParser(@memory['location'].to_i+1) == locationParser(@memory['location'].to_i)
		return "Should I go to the "+locationParser(@memory['location'].to_i+2)+"?"
	end
	if locationParser(@memory['location'].to_i+2) == locationParser(@memory['location'].to_i)
		return "Should I go to the "+locationParser(@memory['location'].to_i+1)+"?"
	end
	return "Should I go to the "+locationParser(@memory['location'].to_i+1)+", or the "+locationParser(@memory['location'].to_i+2)+"?"

end

def tweetFormat user

	# Run Order
	event = eventFormat.to_s
	location = locationFormat

	# Print
	txt = ""
	txt += event
	txt += "\n"
	txt += location
	txt += "\n"
	txt += destinationFormat
	txt += "\n"

	if @memory['exp'].to_i % 7 == 0
		txt += "Week "+(@memory['exp'].to_i / 7).to_s+" by @"+user
	else
		txt += "Day "+@memory['exp'].to_s+" by @"+user	
	end
	

	return txt

end

def parseCommand command

	command = command.gsub("@adventvrecall","").lstrip.rstrip.downcase

	if command.include? locationParser(@memory['location'].to_i+1).downcase
		return 1
	elsif command.include? locationParser(@memory['location'].to_i+2).downcase
		return 2
	end

	return 0

end

def gameNew

	game = Hash.new
	game['hp'] = "10"
	game['location'] = "1"
	game['item'] = "none"
	game['exp'] = "0"

	return game
end

def gameNewFormat

	puts "> new game"
	@memory = gameNew

	txt = "I am in the "+locationParser(@memory['location'].to_i)+" with 10HP, feeling respawned. "
	txt += "\n"
	txt += destinationFormat

	File.open("/etc/cron.minute/adventvrecall.memory.txt", 'w') { |file| file.write(@memory.to_json.to_s.gsub("\\","")) }

	return txt

end

def passiveFormat

	return @world[locationParser(@memory['location'].to_i)]

end


