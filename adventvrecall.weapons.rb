def armoryNew

	weapons = Hash.new

	weapons['none'] = 0

	weapons['tech1'] = "dagger"
	weapons['stake'] = 1

	weapons['tech2'] = "parasol"
	weapons['parasol'] = 2

	weapons['tech3'] = "sword"
	weapons['sword'] = 3

	weapons['tech4'] = "crossbow"
	weapons['crossbow'] = 4

	weapons['tech5'] = "pistol"
	weapons['pistol'] = 5

	weapons['tech6'] = "spellbook"
	weapons['spellbook'] = 6

	weapons['tech7'] = "scythe"
	weapons['scythe'] = 7


	weapons['tool1'] = "coin"
	weapons['coin'] = 2

	weapons['tool2'] = "map"
	weapons['map'] = 2

	weapons['tool3'] = "torch"
	weapons['torch'] = 2


	weapons['misc1'] = "club"
	weapons['club'] = 2

	weapons['misc2'] = "mace"
	weapons['mace'] = 3

	weapons['misc3'] = "staff"
	weapons['staff'] = 4


	weapons['gem1'] = "ruby"
	weapons['ruby'] = 3

	weapons['gem2'] = "diamond"
	weapons['diamond'] = 3

	weapons['gem3'] = "opal"
	weapons['opal'] = 3


	weapons['epic1'] = "Xverin"
	weapons['Xverin'] = 6

	weapons['epic2'] = "Dileterch"
	weapons['Dileterch'] = 7

	weapons['epic3'] = "Archolid"
	weapons['Archolid'] = 8


	weapons['item1'] = "crown"
	weapons['crown'] = 4

	weapons['item2'] = "pendant"
	weapons['pendant'] = 4

	weapons['item3'] = "robe"
	weapons['robe'] = 4
	
	return weapons

end