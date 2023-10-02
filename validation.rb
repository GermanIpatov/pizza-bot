require_relative "Point.rb"
require_relative "logic.rb"

def check_field(x, y)
  x <= 0 || y <= 0 ? error = "Field can't be smaller than 1x1" : "Field is good"
end

def check_coordinates(coords)
  error_count = 0
  coords.each{|i| if i.x < 0 || i.y < 0 then error += 1 }
  error > 0 ? "#{error} coordinates are invalid" : "Coordinates ate good"
end

def check_coord_and_field(x, y, coords)
  error_count = 0
  coords.each{|i| if i.x > x || i.y > y then error += 1 }
  error > 0 ? "#{error} coordinates are out of field" : "All good"
end

def check_input(given_str)
  if given_str.match?(/(\d+x\d+){1}(\(\d+\, \d+\))+/) ? "String is good" : "Invalid format of string"
end
