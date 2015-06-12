def eventBattle name,strength,reward

	# Calculate Damage
	
	damageMinimum = strength - @weapons[@memory['item']].to_i
	damageMaximum = strength
	damageResult = rand(damageMinimum..damageMaximum).to_i

	if damageResult < 0 then damageResult = 0 end

	@memory['hp'] = (@memory['hp'].to_i - damageResult.to_i).to_s

	# If died
	if @memory['hp'].to_i < 1
		# Critical
		if damageResult == damageMaximum then return "I was annihilated by the "+name+"." end
		# Normal
		return "I died battling the "+name+"."
	end

	# Found item, pick up of better
	if @weapons[reward].to_i > @weapons[@memory['item']].to_i
		@memory['item'] = reward
		return "Slew a "+name+", found a "+reward+"."
	end

	# Just won
	if damageResult == 0
		return "Fought a "+name+" and left unhurt."
	else
		return "Fighting a "+name+", I lost "+(damageResult*-1).to_s+"HP."
	end
	
end

def eventHeal verb,gain

	@memory['hp'] = (@memory['hp'].to_i+gain).to_s

	if @memory['hp'].to_i > 10 then @memory['hp'] = "10" end

	return verb+", I gained "+gain.to_s+"HP."

end

def eventItemLoose name

	if @memory['item'] == "none" then return name+"s tried to steal from me." end

	itemName = @memory['item']
	@memory['item'] = "none"
	return "A "+name+" stole my "+itemName+". "

end

def eventItemGain name,item

	@memory['item'] = item
	return "A "+name+" gave me a "+item+". "

end
