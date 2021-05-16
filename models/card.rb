
class Card
	attr_accessor :name, :suite

	def initialize(name, suite)
    @name = name.is_a?(Integer) ? name.to_s : name
    @suite = suite
	end

	def points
    # TODO need to add support of two variants of Ace
    @name.is_a?(Integer) ? @name : 10
	end

  def ==(other_card)
    other_card.instance_of?(Card) && @name == other_card.name && @suite == other_card.suite
  end
end