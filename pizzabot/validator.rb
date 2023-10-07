require_relative "Parser"

class MyValidator

  @@size_of_field_x = 0
  @@size_of_field_y = 0
  @@coordinates = []
  

  def self.size_of_field_x
    @@size_of_field_x
  end

  def self.size_of_field_y
    @@size_of_field_y
  end

  def self.coordinates
    @@coordinates
  end





  HASH = {0 => "Field can't be smaller than 1x1", 2 => "Coordinates are out of field", 3 => "Invalid format of input"}
  
  
  def self.check(given_str)


    if check_input(given_str) == false 
      HASH[3]
    elsif check_field == false
      HASH[0]
    elsif check_coord_and_field == false
      HASH[2]
    else
      ''
    end
  end



  def self.check_field
    @@size_of_field_x > 0 && @@size_of_field_y > 0 ? true : false
  end 

  def self.check_coord_and_field
    @@coordinates.each do |i|
      if i.x > @@size_of_field_x || i.y > @@size_of_field_y
        return false
      end
    end
    true
  end

  def self.check_input(given_str)
    given_str.match?(/(\d+x\d+)(\(\d+\, \d+\))+/) ? true : false
  end

  def self.set_input(given_str)
    size_of_field = Parser.get_size_of_field(given_str)
    @@size_of_field_x, @@size_of_field_y = size_of_field
    @@coordinates = Point.to_point(Parser.get_coordinates_arr(given_str))
  end
  
end


