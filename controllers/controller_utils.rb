# frozen_string_literal: true

##
# Utils methods for controllers
module ControllerUtils
  def self.included(init_class)
    init_class.send :include, InstanceModule
  end

  ##
  # declare all needed instance methods
  module InstanceModule
    def confirm(message = "Подтвердите")
      ["y", "д", "+"].include?(prompt("#{message} y/д/+ - да").downcase)
    end

    def prompt(question = "Введите значение", with_chomp: true)
      printf "\t#{question}: "
      with_chomp ? gets.chomp : gets
    end
  end
end
