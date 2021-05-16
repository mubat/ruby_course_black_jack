# frozen_string_literal: true

##
# Main class for all controllers.
# All other controllers should implements it
class ControllerBasic
  def confirm(message = 'Подтвердите')
    ['y', 'д', '+'].include?(prompt("#{message} y/д/+ - да").downcase)
  end

  def prompt(question = 'Введите значение', with_chomp: true)
    printf "\t#{question}: "
    with_chomp ? gets.chomp : gets
  end
end
