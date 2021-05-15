
class Card
	attr_accessor :name :suite

	def initialize(name, suite)
    @name = name.to_i ? name.to_i : name
    @suite = suite
	end

	def points
    # calculate points according name
	end

  def ==(other_card)
    other_card.instance_of?(Card) && @name == other_card.name && @suite == other_card.suited
  end
end