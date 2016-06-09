#!/bin/env ruby
# encoding: utf-8

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
		location.addEvent(Event.new(4, Encounter.new("fighting a thief at",5), itemWithPower(2) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drinking ale at",-1), nil))
		location.addEvent(Event.new(nil, Encounter.new("fighting a drunk in",2), nil))
		location.addEvent(Event.new(nil, Encounter.new("drinking poison",@_curse), nil))
		return location

	end

	def location_castle

		location = Location.new("castle")
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battling a mercenary at",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("defending",0), itemWithPower(1) ))
		location.addEvent(Event.new(nil, Encounter.new("meeting the queen of",-2), nil))
		return location

	end

	def location_lake

		location = Location.new("lake")
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a slug at",3), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("swimming in",-1), nil))
		location.addEvent(Event.new(nil, Encounter.new("punching a serpent at",3), nil))
		location.addEvent(Event.new(nil, Encounter.new("swimming in",@_thief), nil))
		return location

	end

	def location_forest

		location = Location.new("forest")
		location.addPicture
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting a ghost in",5), itemWithPower(3) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("hunting in",0), itemWithPower(2) ))
		location.addEvent(Event.new(nil, Encounter.new("stepping in a bee's nest in",@_curse), nil))
		return location

	end

	def location_camp

		location = Location.new("camp")
		# Boss
		location.addEvent(Event.new(5, Encounter.new("assaulting a knight at",6), nil))
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a soldier at",3), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("sleeping at",-2), nil ))
		location.addEvent(Event.new(nil, Encounter.new("meeting a wolf",-2), nil))
		location.addEvent(Event.new(nil, Encounter.new("drinking with a thief",@_thief), nil))
		return location

	end

	def location_cave

		location = Location.new("cave")
		# Battle
		location.addEvent(Event.new(5, Encounter.new("battling a cadaver in",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("swatting a bat in",2), nil))
		location.addEvent(Event.new(nil, Encounter.new("battling a rat in",3), nil))
		location.addEvent(Event.new(nil, Encounter.new("descending into",0), itemWithPower(3) ))
		location.addEvent(Event.new(nil, Encounter.new("falling down the",@_curse), nil))
		return location

	end

	def location_swamp

		location = Location.new("swamp")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting an elemental by",5), itemWithPower(4) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("mud-bathing in",-2), nil ))
		location.addEvent(Event.new(nil, Encounter.new("encountering the witch of",@_curse), nil))
		return location

	end

	# =============================
	# Chapter 2
	# =============================


	def location_tower

		location = Location.new("tower")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting a guard in",6), itemWithPower(3) ))
		# Passive
		location.addEvent(Event.new( nil, Encounter.new("drinking wine in",-3), nil))
		location.addEvent(Event.new(nil, Encounter.new("battling a drake",7), nil))
		return location

	end

	def location_maze

		location = Location.new("maze")
		location.addPicture
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battling a worm in",5), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("reaching",0), itemWithPower(4) ))
		location.addEvent(Event.new(nil, Encounter.new("fighting a vampire in",6), nil))
		location.addEvent(Event.new(nil, Encounter.new("confused",@_thief), nil))
		return location

	end

	def location_valley

		location = Location.new("valley")
		# Boss
		location.addEvent(Event.new(5, Encounter.new("assaulting the caravan in",6), nil))
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a nomad in",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drinking in",-3), nil))
		location.addEvent(Event.new(nil, Encounter.new("battling a cadaver in",4), nil))
		return location

	end

	def location_dunes

		location = Location.new("dunes")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting a sandman in",6), itemWithPower(4) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("stranded in",0), itemWithPower(5) ))
		location.addEvent(Event.new(nil, Encounter.new("finding the oasis in",-3), nil))
		return location

	end

	def location_monolith

		location = Location.new("monolith")
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a bat by",4), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("praying by",-4), nil ))
		location.addEvent(Event.new(nil, Encounter.new("meeting the lesser god near",8), nil))
		return location

	end

	def location_crypt

		location = Location.new("crypt")
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battling a vampire at",6), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("exploring",0), itemWithPower(6) ))
		location.addEvent(Event.new(nil, Encounter.new("battling a zombie in",4), nil))
		location.addEvent(Event.new(nil, Encounter.new("fighting a ghost",@_thief), nil))
		return location

	end

	def location_crossroad

		location = Location.new("crossroad")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting a traveler at",6), itemWithPower(5) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("shopping at",-4), nil ))
		location.addEvent(Event.new(nil, Encounter.new("fighting wanderers by",3), nil))
		location.addEvent(Event.new(nil, Encounter.new("playing cards",@_thief), nil))
		return location

	end

	# =============================
	# Chapter 3
	# =============================


	def location_fortress

		location = Location.new("fortress")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting the prince at",7), itemWithPower(4) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drinking moonshine",-5), nil))
		location.addEvent(Event.new(nil, Encounter.new("caught by the guards",@_thief), nil))
		return location

	end

	def location_necropolis

		location = Location.new("necropolis")
		location.addPicture
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battling an undead at",6), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("exploring",0), itemWithPower(7) ))
		location.addEvent(Event.new(nil, Encounter.new("wandering in",3), nil))
		return location

	end

	def location_fountain

		location = Location.new("fountain")
		# Boss
		location.addEvent(Event.new(5, Encounter.new("assaulting the merfolks",7), itemWithPower(5) ))
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting a leviathan in",5), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("drinking from",-5), nil))
		return location

	end

	def location_mines

		location = Location.new("mines")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting a goblin",7), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("excavating",0), itemWithPower(8) ))
		location.addEvent(Event.new(nil, Encounter.new("battling a tunneler in",@_curse), nil))
		location.addEvent(Event.new(nil, Encounter.new("confused",@_thief), nil))
		return location

	end

	def location_abyss

		location = Location.new("abyss")
		# Battle 1
		location.addEvent(Event.new(6, Encounter.new("fighting the imp in",5), itemWithPower(7)))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("finding food in",-6), nil ))
		location.addEvent(Event.new(nil, Encounter.new("fighting the gatekeeper in",11), nil))
		location.addEvent(Event.new(nil, Encounter.new("lost in",@_curse), nil))
		return location

	end

	def location_trench

		location = Location.new("trench")
		# Battle 2
		location.addEvent(Event.new(5, Encounter.new("battling a demon at",6), nil))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("opening a tomb in",0), itemWithPower(9) ))
		location.addEvent(Event.new(nil, Encounter.new("battling a fish in",1), nil))
		return location

	end

	def location_portal

		location = Location.new("portal")
		# Battle 3
		location.addEvent(Event.new(4, Encounter.new("fighting god",14), itemWithPower(6) ))
		# Passive
		location.addEvent(Event.new(nil, Encounter.new("traversing",-6), nil ))
		location.addEvent(Event.new(nil, Encounter.new("battling an orb",3), nil))
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