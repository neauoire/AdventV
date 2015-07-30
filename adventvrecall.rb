#!/bin/env ruby
# encoding: utf-8
begin

require 'rubygems'
require 'twitter'
require 'json'

require_relative 'class.setup.rb'

require_relative 'class.adventv.rb'
require_relative 'class.item.rb'
require_relative 'class.encounter.rb'
require_relative 'class.location.rb'
require_relative 'class.world.rb'
require_relative 'class.event.rb'

$world   = World.new()
$adventv = AdventV.new()
$setup   = Setup.new()

client = Twitter::REST::Client.new($setup.twitter)

puts "<pre>"

puts "#{$adventv.hp}HP | #{$adventv.location.name} \n"

if $adventv.hp <= 0
	$adventv.setLocationId(1)
	$adventv.setDay(1)
	$adventv.setHp(10)
	$adventv.move($world.location(1))
	tweetEntry = $adventv.echo
	$adventv.saveMemory
	puts tweetEntry
	client.update_with_media(tweetEntry, File.new("/var/www/core.xxiivv/public_html/adventv/graphics/#{$adventv.location.name}.png"))
end

client.search("to:adventvrecall", :result_type => "recent").take(1).each do |tweet|

	puts "<br />> #{tweet.text}"

	tweetUsername = tweet.user.screen_name
	tweetCommand = tweet.text.downcase

	$adventv.locations.each do |distance,location|
		puts "- "+location.name.to_s+"\n"
		if !tweetCommand.include?(location.name) then next end
		if tweetCommand == $adventv.lastCommand then next end
		$adventv.setLocationId($adventv.locationId + distance)
		$adventv.setLastMaster(tweetUsername)
		$adventv.setLastCommand(tweetCommand)
		$adventv.setDay($adventv.day + 1)
		$adventv.move(location)
		tweetEntry = $adventv.echo
		$adventv.saveMemory
		puts tweetEntry
		client.follow(tweet.user.screen_name)

		# Died in Combat
		if $adventv.hp <= 0
			client.update_with_media("I died but I will respawn..", File.new("/var/www/core.xxiivv/public_html/adventv/graphics/death.png"))
			break
		end

		# Otherwise..
		if location.hasPicture
			client.update_with_media(tweetEntry, File.new("/var/www/core.xxiivv/public_html/adventv/graphics/#{$adventv.location.name}.png"))
		else
			client.update(tweetEntry, in_reply_to_status_id: tweet.id)
		end

		break
	end

end
puts "\n#{$adventv.hp}HP | #{$adventv.location.name} \n"
puts "</pre>"

# 

=begin




client = Twitter::REST::Client.new(config)

client.search("to:adventvrecall", :result_type => "recent").take(1).each do |tweet|

	# Settings

	tweetCommand = tweet.text
	tweetUsername = tweet.user.screen_name

	# Respawn
	if @memory['hp'].to_i < 1
		client.update(gameNewFormat)
		break
	end

	# Last command is worth something
	if parseCommand(tweetCommand) == 0
		# Passive tweet
		if @memory['lastCommand'] != "passive" && @memory['exp'].to_i % 3 == 0
			client.update(passiveFormat)
			@memory['lastCommand'] = "passive"
			File.open($memoryFilePath, 'w') { |file| file.write(@memory.to_json) }
		end
		puts "> Unknown destination: "+tweetCommand+", currently at: "+locationParser(@memory['location'].to_i)+"("+locationParser(@memory['location'].to_i+1)+"/"+locationParser(@memory['location'].to_i+2)+")"
		break
	end

	# Begin Normal

	@memory['location'] = (@memory['location'].to_i+parseCommand(tweetCommand)).to_s
	@memory['exp'] = (@memory['exp'].to_i+1).to_s

	tweetOutput = tweetFormat(tweetUsername)

	puts tweetOutput

	@memory['lastCommand'] = "active"
	@memory['lastMaster'] = tweetUsername

	# Tweet

	if tweetOutput.length < 141

		puts "> Posted: "+tweetCommand

		# client.follow(tweet.user.screen_name)
		# client.update(tweetOutput, in_reply_to_status_id: tweet.id)
		# client.update_with_media("I'm tweeting with @gem!", File.new("/path/to/media.png"))

		File.open($memoryFilePath, 'w') { |file| file.write(@memory.to_json) }
		break

	end

	# Catch too long
	puts "> Too long: "+tweetOutput.length.to_s+" - "+tweetOutput
	
end

=end

rescue Exception

	error = $@
	errorCleaned = error.to_s.gsub(", ","<br />").gsub("`","<b>").gsub("'","</b>").gsub("\"","").gsub("/var/www/wiki.xxiivv/public_html/","")
	errorCleaned = errorCleaned.gsub("[","\n").gsub("]","")

	puts "<pre><b>Error</b>     "+$!.to_s.gsub("`","<b>").gsub("'","</b>")+"<br/><b>Location</b>  "+errorCleaned+"<br /><b>Report</b>    Please, report this error to <a href='https://twitter.com/aliceffekt'>@aliceffekt</a></pre>"

end