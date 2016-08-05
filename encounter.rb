#!/bin/env ruby
# encoding: utf-8

class Encounter

	def initialize action, power
		@action = action
		@power = power		
	end

	def action
		return @action
	end
	
	def power
		return @power
	end

end