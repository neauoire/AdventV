#!/usr/bin/env ruby 

require 'rubygems'
require 'twitter'
require 'json'

require '/etc/cron.minute/adventvrecall.weapons.rb'
require '/etc/cron.minute/adventvrecall.world.rb'

require '/etc/cron.minute/adventvrecall.basic.rb'
require '/etc/cron.minute/adventvrecall.events.rb'
require '/etc/cron.minute/adventvrecall.locations.rb'

config = {
  :consumer_key    => "",
  :consumer_secret => "",
  :access_token        => "-",
  :access_token_secret => ""
}

@weapons = armoryNew
@world = worldNew

# Parser

memory = File.read("/etc/cron.minute/adventvrecall.memory.txt")
@memory = JSON.parse(memory)

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
			File.open("/etc/cron.minute/adventvrecall.memory.txt", 'w') { |file| file.write(@memory.to_json) }
		end
		puts "> Unknown destination: "+tweetCommand+", currently at: "+locationParser(@memory['location'].to_i)+"("+locationParser(@memory['location'].to_i+1)+"/"+locationParser(@memory['location'].to_i+2)+")"
		break

	end

	# Begin Normal

	@memory['location'] = (@memory['location'].to_i+parseCommand(tweetCommand)).to_s
	@memory['exp'] = (@memory['exp'].to_i+1).to_s

	tweetOutput = tweetFormat(tweetUsername)

	@memory['lastCommand'] = "active"
	@memory['lastMaster'] = tweetUsername

	# Tweet

	if tweetOutput.length < 141

		puts "> Posted: "+tweetCommand

		client.follow(tweet.user.screen_name)
		client.update(tweetOutput, in_reply_to_status_id: tweet.id)

		File.open("/etc/cron.minute/adventvrecall.memory.txt", 'w') { |file| file.write(@memory.to_json) }
		break

	end

	# Catch too long

	puts "> Too long: "+tweetOutput.length.to_s+" - "+tweetOutput
	
end

