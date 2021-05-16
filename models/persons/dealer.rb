# frozen_string_literal: true

require_relative "person"

##
# Its a robot!
class Dealer < Person
  def initialize(name = "Дилер")
    super(name)
  end
end
