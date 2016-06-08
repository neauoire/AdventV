class World

	def initialize

	end

	def location target

		# Act 3

		if target % 37 == 0 then return location_portal end
		if target % 36 == 0 then return location_trench end
		if target % 35 == 0 then return location_abyss end
		if target % 34 == 0 then return location_mines end
		if target % 33 == 0 then return location_fountain end
		if target % 32 == 0 then return location_necropolis end
		if target % 31 == 0 then return location_fortress end

		# Act 2

		if target % 22 == 0 then return location_crossroad end
		if target % 21 == 0 then return location_crypt end
		if target % 20 == 0 then return location_monolith end
		if target % 19 == 0 then return location_dunes end
		if target % 18 == 0 then return location_valley end
		if target % 17 == 0 then return location_maze end
		if target % 16 == 0 then return location_tower end

		# Act 1

		if target % 7 == 0 then return location_swamp end
		if target % 6 == 0 then return location_cave end
		if target % 5 == 0 then return location_camp end
		if target % 4 == 0 then return location_forest end
		if target % 3 == 0 then return location_lake end
		if target % 2 == 0 then return location_castle end
		if target % 1 == 0 then return location_tavern end

	end

	# =============================
	# Champter 1
	# =============================

	def location_tavern

		location = Location.new("tavern")
		location.addPicture
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a thief at",5), itemWithPower(2) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drinking ale at",-1), nil))
		location.addEvent(Event.new(nil, Encounter.new("fought a drunk in",2), nil))
		return location

	end

	def location_castle

		location = Location.new("castle")
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battled a mercenary at",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("defended",0), itemWithPower(1) ))
		location.addEvent(Event.new(nil, Encounter.new("met the queen of",-2), nil))
		return location

	end

	def location_lake

		location = Location.new("lake")
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a slug at",3), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("swimming in",-1), nil))
		location.addEvent(Event.new(nil, Encounter.new("punched a serpent at",3), nil))
		return location

	end

	def location_forest

		location = Location.new("forest")
		location.addPicture
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a ghost in",5), itemWithPower(3) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("hunting in",0), itemWithPower(2) ))
		location.addEvent(Event.new(nil, Encounter.new("steps in a bee's nest in",3), nil))
		return location

	end

	def location_camp

		location = Location.new("camp")
		# Boss
		location.addEvent(Event.new(5, Encounter.new("assaulted a knight at",6), nil))
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a soldier at",3), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("sleeping at",-2), nil ))
		location.addEvent(Event.new(nil, Encounter.new("met a wolf",-2), nil))
		return location

	end

	def location_cave

		location = Location.new("cave")
		# Battle
		location.addEvent(Event.new(5, Encounter.new("battled a cadaver in",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("swatted a bat in",2), nil))
		location.addEvent(Event.new(nil, Encounter.new("batted a rat in",3), nil))
		location.addEvent(Event.new(nil, Encounter.new("descended into",0), itemWithPower(3) ))
		return location

	end

	def location_swamp

		location = Location.new("swamp")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought an elemental by",5), itemWithPower(4) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("mud-bathing in",-2), nil ))
		location.addEvent(Event.new(nil, Encounter.new("encountered the witch of",3), nil))
		return location

	end

	# =============================
	# Chapter 2
	# =============================


	def location_tower

		location = Location.new("tower")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a guard in",6), itemWithPower(3) ))
		# Passive
		location.addEvent(Event.new( nil, Encounter.new("drinking wine in",-3), nil))
		location.addEvent(Event.new(nil, Encounter.new("batted a drake",7), nil))
		return location

	end

	def location_maze

		location = Location.new("maze")
		location.addPicture
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battled a worm in",5), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("reaching",0), itemWithPower(4) ))
		location.addEvent(Event.new(nil, Encounter.new("fought a vampire in",6), nil))
		return location

	end

	def location_valley

		location = Location.new("valley")
		# Boss
		location.addEvent(Event.new(5, Encounter.new("assaulted the caravan in",6), nil))
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a nomad in",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drinking in",-3), nil))
		location.addEvent(Event.new(nil, Encounter.new("batted a cadaver in",4), nil))
		return location

	end

	def location_dunes

		location = Location.new("dunes")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a sandman in",6), itemWithPower(4) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("stranded in",0), itemWithPower(5) ))
		location.addEvent(Event.new(nil, Encounter.new("found the oasis in",-3), nil))
		return location

	end

	def location_monolith

		location = Location.new("monolith")
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fought a bat by",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("prayed by",-4), nil ))
		location.addEvent(Event.new(nil, Encounter.new("met god near",8), nil))
		return location

	end

	def location_crypt

		location = Location.new("crypt")
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battled a vampire at",6), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("explored",0), itemWithPower(6) ))
		location.addEvent(Event.new(nil, Encounter.new("batted a zombie in",4), nil))
		return location

	end

	def location_crossroad

		location = Location.new("crossroad")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a traveler at",6), itemWithPower(5) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("shopped at",-4), nil ))
		location.addEvent(Event.new(nil, Encounter.new("fought wanderers by",3), nil))
		return location

	end

	# =============================
	# Chapter 3
	# =============================


	def location_fortress

		location = Location.new("fortress")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought the prince at",7), itemWithPower(4) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drank moonshine",-5), nil))
		return location

	end

	def location_necropolis

		location = Location.new("necropolis")
		location.addPicture
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battled an undead at",6), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("explored",0), itemWithPower(7) ))
		location.addEvent(Event.new(nil, Encounter.new("wandering in",3), nil))
		return location

	end

	def location_fountain

		location = Location.new("fountain")
		# Boss
		location.addEvent(Event.new(5, Encounter.new("assaulted the merfolks",7), itemWithPower(5) ))
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fought a leviathan in",5), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drank from",-5), nil))
		return location

	end

	def location_mines

		location = Location.new("mines")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a goblin",7), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("excavated",0), itemWithPower(8) ))
		location.addEvent(Event.new(nil, Encounter.new("batted a tunneler in",6), nil))
		return location

	end

	def location_abyss

		location = Location.new("abyss")
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting the imp in",5), itemWithPower(7)))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("finding food in",-6), nil ))
		location.addEvent(Event.new(nil, Encounter.new("fought the gatekeeper in",11), nil))
		location.addEvent(Event.new(nil, Encounter.new("lost",-5), nil))
		return location

	end

	def location_trench

		location = Location.new("trench")
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battled a demon at",6), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("opening a tomb in",0), itemWithPower(9) ))
		location.addEvent(Event.new(nil, Encounter.new("batted a fish in",1), nil))
		return location

	end

	def location_portal

		location = Location.new("portal")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fought a small god",7), itemWithPower(6) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("traversed",-6), nil ))
		location.addEvent(Event.new(nil, Encounter.new("batted an orb",3), nil))
		return location

	end

	def allItems

		items = {}
		items["knife"] 	= 1
		items["dagger"] 	= 2
		items["sword"]  	= 3
		items["staff"] 		= 4
		items["mace"] 		= 5
		items["crossbow"] 	= 6
		items["spellbook"] 	= 7

		return items
	end

	def item name

		if allItems[name]
			return Item.new(name,allItems[name])
		end

		return

	end

	def itemWithPower targetPower

		allItems.each do |name,itemPower|
			if targetPower == itemPower then return item(name) end
		end
		
	end

end