require_relative "logic.rb"

print "Enter field and coordinates (format: 1x2(x1, y1)(x2, y2)) - "
coordinates_string = gets.chomp
PizzaBot.get_navigation(coordinates_string)
print "Result is: "
PizzaBot.mooving