def worldNew

	world = Hash.new

	world['tavern'] = "Having a drink at the tavern.\nThe barman asks me for "+@weapons['tool1']+"s. #poor"
	world['maze'] = "Getting lost..\nI wish I had a "+@weapons['tool2']+". #lost"
	world['underworld'] = "Can't see shit!\nIf only I had a "+@weapons['tool3']+"s. #gloom"

	world['castle'] = "Card games with the castle guards.\nThe queen sends me to look for "+@weapons['gem1']+"s. #swag"
	world['tower'] = "Taking selfies with the knights at the castle.\nThe queen asks me for "+@weapons['gem2']+"s. #bling"
	world['castle'] = "Getting my ass kicked by the templars.\nThe queen sends me to look for "+@weapons['gem3']+"s. #fash"

	world['forest'] = "At the stinky caravan.\nMerchants be looking for either a "+@weapons['tech3']+" or a "+@weapons['tech4']+". #trade"
	world['valley'] = "At the hugly caravan.\nTraders are looking for either a "+@weapons['tech4']+" or a "+@weapons['tech5']+". #swap"
	world['mines'] = "At the noisy caravan.\nScavengers are looking for either a "+@weapons['tech5']+" or a "+@weapons['tech6']+". #gimme"

	world['lake'] = "Swimming. \n#"+@weapons['item1']+" #ujelly"
	world['monolith'] = "Rolling down the grass hills.\nLoving this gorgeous place. #"+@weapons['item1']+""
	world['fountain'] = "Drinking from the fountain of youth.\nNot that I will ever survive long enough to age. #fml #"+@weapons['item1']+""

	world['swamp'] = "Fuck that stinky bog. \nLife in the #trash"
	world['dunes'] = "Sand, sand for ever. \nSend #water"
	world['abyss'] = "Hello? Hell- Hel He- H- \n#echo"

	world['cave'] = "Killin them slimes \nNeed me a #"+@weapons['tool3']+""
	world['crypt'] = "Killin them vampires \nNeed me a #"+@weapons['tool2']+""
	world['trench'] = "Killin them ghosts \nNeed me a #"+@weapons['tool1']+""

	world['camp'] = "No idea what this place is about.. \n#hippies"
	world['crossroad'] = "No one ever came.. \n#lone"
	world['portal'] = "Nothing to see here.. \n#stargate"

	return world

end