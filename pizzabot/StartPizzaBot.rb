require_relative "logic"
require_relative "validator"

class StartPizzaBot
  def self.start
    coordinates_string = ""

    loop do
      p "Enter field and coordinates (format: 1x2(x1, y1)(x2, y2)) - "
      coordinates_string = gets.chomp
      MyValidator.set_input(coordinates_string)
      errors = MyValidator.check(coordinates_string)
      
      break if errors.empty?
      p errors
    end 
    PizzaBot.get_navigation(coordinates_string)
    p PizzaBot.deliver_pizza
  end
end



