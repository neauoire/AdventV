# Gates

def locationTavern

	if @memory['item'] == @weapons['tool1'] then return eventHeal("Drinking",3) end
	if @memory['item'] == @weapons['tech1'] then return eventHeal("Drinking",4) end

	eventBattle("soldier",2,@weapons['misc1'])

end

def locationMaze

	if @memory['item'] == @weapons['tool2'] then return eventHeal("Solving",3) end
	if @memory['item'] == @weapons['tech2'] then return eventHeal("Solving",4) end

	eventBattle("minotaure",3,@weapons['misc2'])

end

def locationNecropolis

	if @memory['item'] == @weapons['tool3'] then return eventHeal("Solving",4) end
	if @memory['item'] == @weapons['tech3'] then return eventHeal("Solving",5) end
	eventBattle("ghoul",4,@weapons['misc3'])

end

# Armory

def locationCastle

	if @memory['item'] == @weapons['gem1'] then return eventItemGain("queen",@weapons['tool1']) end

	if eventRank == 1 then return eventItemGain("guard",@weapons['tech1']) end
	if eventRank == 2 then return eventItemGain("knight",@weapons['tech3']) end
	if eventRank == 3 then return eventItemGain("templar",@weapons['tech5']) end

	eventBattle("zealot",7,@weapons['epic1'])

end

def locationTower

	if @memory['item'] == @weapons['gem2'] then return eventItemGain("queen",@weapons['tool2']) end

	if eventRank == 1 then return eventItemGain("guard",@weapons['tech2']) end
	if eventRank == 2 then return eventItemGain("knight",@weapons['tech4']) end
	if eventRank == 3 then return eventItemGain("templar",@weapons['tech6']) end

	eventBattle("zealot",7,@weapons['epic2'])

end

def locationFortress

	if @memory['item'] == @weapons['gem3'] then return eventItemGain("queen",@weapons['tool3']) end

	if eventRank == 1 then return eventItemGain("guard",@weapons['tech4']) end
	if eventRank == 2 then return eventItemGain("knight",@weapons['tech5']) end
	if eventRank == 3 then return eventItemGain("templar",@weapons['tech7']) end

	eventBattle("zealot",7,@weapons['epic3'])

end

# Steal Spots

def locationForest

	if @memory['item'] == @weapons['tech3'] then return eventItemGain("caravaneer",@weapons['tech4']) end
	if @memory['item'] == @weapons['tech4'] then return eventItemGain("caravaneer",@weapons['tech5']) end

	if eventRank == 1 then return eventItemLoose("thief") end
	if eventRank == 2 then return eventItemLoose("bandit") end
	if eventRank == 3 then return eventItemLoose("outlaw") end

	eventBattle("deer god",10,@weapons['epic1'])

end

def locationValley

	if @memory['item'] == @weapons['tech4'] then return eventItemGain("caravaneer",@weapons['tech5']) end
	if @memory['item'] == @weapons['tech5'] then return eventItemGain("caravaneer",@weapons['tech6']) end

	if eventRank == 1 then return eventItemLoose("valleyfolk") end
	if eventRank == 2 then return eventItemLoose("hillfolk") end
	if eventRank == 3 then return eventItemLoose("highlander") end

	eventBattle("deer god",10,@weapons['epic1'])

end

def locationMines

	if @memory['item'] == @weapons['tech5'] then return eventItemGain("caravaneer",@weapons['tech6']) end
	if @memory['item'] == @weapons['tech6'] then return eventItemGain("caravaneer",@weapons['tech7']) end

	if eventRank == 1 then return eventItemLoose("miner") end
	if eventRank == 2 then return eventItemLoose("crab") end
	if eventRank == 3 then return eventItemLoose("centipede") end

	eventBattle("deer god",10,@weapons['epic1'])

end

# Heal Spots

def locationLake

	if @memory['item'] == @weapons['item1'] then return eventItemGain("siren",@weapons['tech4']) end

	if eventRank == 1 then return eventHeal("Swimming",2) end
	if eventRank == 2 then return eventHeal("Swimming",3) end
	if eventRank == 3 then return eventHeal("Swimming",4) end

	eventBattle("serpent",11,@weapons['epic2'])

end

def locationMonolith

	if @memory['item'] == @weapons['item2'] then return eventItemGain("siren",@weapons['tech5']) end

	if eventRank == 1 then return eventHeal("Praying",3) end
	if eventRank == 2 then return eventHeal("Praying",4) end
	if eventRank == 3 then return eventHeal("Praying",5) end

	eventBattle("dragon",11,@weapons['epic2'])

end

def locationFountain

	if @memory['item'] == @weapons['item3'] then return eventItemGain("siren",@weapons['tech6']) end

	if eventRank == 1 then return eventHeal("Drinking",4) end
	if eventRank == 2 then return eventHeal("Drinking",5) end
	if eventRank == 3 then return eventHeal("Drinking",6) end

	eventBattle("wyvern",11,@weapons['epic2'])

end

# Quest

def locationSwamp
	
	if eventLuck == 0 then return eventItemGain("morph",@weapons['tech3']) end
	if eventLuck == 1 then return eventItemLoose("morph") end
	if eventLuck == 2 then return eventBattle("morph",4,@weapons['item1']) end
	if eventLuck == 3 then return eventHeal("Foraging",4) end

	eventBattle("derelic",12,@weapons['epic3'])

end

def locationDunes
	
	if eventLuck == 0 then return eventItemGain("steamer",@weapons['tech4']) end
	if eventLuck == 1 then return eventItemLoose("steamer") end
	if eventLuck == 2 then return eventBattle("steamer",5,@weapons['item2']) end
	if eventLuck == 3 then return eventHeal("An oasis",5) end

	eventBattle("derelic",12,@weapons['epic3'])

end

def locationAbyss
	
	if eventLuck == 0 then return eventItemGain("specter",@weapons['tech5']) end
	if eventLuck == 1 then return eventItemLoose("specter") end
	if eventLuck == 2 then return eventBattle("specter",6,@weapons['item3']) end
	if eventLuck == 3 then return eventHeal("Found an oasis",6) end

	eventBattle("derelic",12,@weapons['epic3'])

end

# Event

def locationCave
	
	if @memory['item'] == @weapons['tool3'] then return "Safely crossed the cave." end

	if eventRank == 1 then return eventBattle("slime",4,@weapons['gem1']) end
	if eventRank == 2 then return eventBattle("bat",5,@weapons['gem2']) end
	if eventRank == 3 then return eventBattle("rat",6,@weapons['gem3']) end

	eventBattle("excavator",13,@weapons['epic1'])

end

def locationCrypt
	
	if @memory['item'] == @weapons['tool2'] then return "Safely crossed the crypt." end

	if eventRank == 1 then return eventBattle("zombie",5,@weapons['gem1']) end
	if eventRank == 2 then return eventBattle("mummy",6,@weapons['gem2']) end
	if eventRank == 3 then return eventBattle("vampire",7,@weapons['gem3']) end

	eventBattle("reaper",13,@weapons['epic2'])

end

def locationTrench
	
	if @memory['item'] == @weapons['tool1'] then return "Safely crossed the trench." end

	if eventRank == 1 then return eventBattle("fallen",6,@weapons['gem1']) end
	if eventRank == 2 then return eventBattle("fallen",7,@weapons['gem2']) end
	if eventRank == 3 then return eventBattle("drake",8,@weapons['gem3']) end

	eventBattle("demon",13,@weapons['epic3'])

end

# Special

def locationCamp
	
	return "Nothing here yet. "

end

def locationCrossroad
	
	return "Nothing here yet. "

end

def locationPortal
	
	return "Nothing here yet. "

end

# Extras

def eventRank

	return (@memory['exp'].to_i / 7)+1

end

def eventLuck

	return @memory['hp'].to_i % 4

end

