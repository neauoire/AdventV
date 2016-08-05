#!/bin/env ruby
# encoding: utf-8

require 'json'
require 'date'
require 'rubygems'

require_relative 'adventv.rb'
require_relative 'item.rb'
require_relative 'encounter.rb'
require_relative 'location.rb'
require_relative 'world.rb'
require_relative 'event.rb'

class Adventv

	include Lamp

	def initialize query = nil

		$world   = World.new()
		$adventv = AdventV.new()

		@_curse = 900
		@_thief = 800

	end

	def application query = nil

		# Respawn
		if $adventv.hp <= 0 then return respawn end

		# Reply
		require_relative("../apis.tweet/secret.adventv.config.rb")
		client = Twitter::REST::Client.new($twitter_config)
		client.search("to:adventvrecall", :result_type => "recent").take(1).each do |tweet|
			answer = response(tweet.user.screen_name, tweet.text.downcase)
			if !answer then return "No answer" end
			if answer.last
				client.update_with_media(answer.first, answer.last, in_reply_to_status_id: tweet.id)
			else
				client.update(answer.first, in_reply_to_status_id: tweet.id)
			end
			client.follow(tweet.user.screen_name)
		end

	end

	def response username, command

		if command == $adventv.lastCommand then return end

		username = query.split(" ")[0]
		command  = query.sub("#{username}","").strip
		$adventv.locations.each do |distance,location|
			if !command.include?(location.name) then next end
			return act(username,command,distance,location)
		end

		return nil

	end

	def act username,command,distance,location

		$adventv.setLocationId($adventv.locationId + distance)
		$adventv.setDay($adventv.day + 1)
		$adventv.move(location)
		$adventv.setLastMaster(username)
		$adventv.setLastCommand(command)
		tweetEntry = $adventv.echo
		$adventv.saveMemory

		return [tweetEntry, $adventv.hp < 1 ? graphic("death") : (location.hasPicture ? graphic($adventv.location.name) : nil)]

	end

	def respawn

		$adventv.setLocationId(1)
		$adventv.setDay(1)
		$adventv.setHp(10)
		$adventv.setItem(nil)
		$adventv.move($world.location(1))
		tweetEntry = $adventv.echo
		$adventv.saveMemory
		return tweetEntry, graphic($adventv.location.name)

	end

	def graphic name

		File.new("#{$jiin_path}/disk/auto.adventv/graphics/#{name}.png")

	end

end