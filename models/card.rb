
class Card
	attr_accessor :name :suite

	def initialize(name, suite)
    @name = name.to_i ? name.to_i : name
    @suite = suite
	end

	def points
    # calculate points according name
	end
end