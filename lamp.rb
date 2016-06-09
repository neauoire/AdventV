#!/bin/env ruby
# encoding: utf-8

require 'json'
require 'date'
require 'rubygems'

require_relative 'class.adventv.rb'
require_relative 'class.item.rb'
require_relative 'class.encounter.rb'
require_relative 'class.location.rb'
require_relative 'class.world.rb'
require_relative 'class.event.rb'

class Adventv

	include Lamp

	def initialize query = nil

		$world   = World.new()
		$adventv = AdventV.new()

		@_curse = 900
		@_thief = 800

	end

	def application query = nil

		# Skip already performed commands
		if query == $adventv.lastCommand then return end

		if $adventv.hp <= 0
			return respawn
		elsif query.split(" ").length > 2
			username = query.split(" ")[1]
			command  = query.sub("adventv #{username}","").strip
			$adventv.locations.each do |distance,location|
				if !command.include?(location.name) then next end
				return act(username,command,distance,location)
			end
		end

		puts "#{$adventv.debug}\n"

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