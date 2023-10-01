require_relative "Parser.rb"

class PizzaBot
        

    def self.get_navigation(given_str)                           
        size_of_field = Parser.get_size_of_field(given_str)
        @size_of_field_x, @size_of_field_y = size_of_field
        p @size_of_field_x, @size_of_field_y
        @coordinates = Parser.get_coordinates_arr(given_str)
    end

    def self.deliver_pizza
        @current = [0, 0]
        
        @path = ""
        @coordinates.each{|i| aim(i)}
        @path                                    
    end

    def self.aim(goal)
        original = @current[0], @current[1]    
        until @current[0] == goal[0] 
            goal[0] > @current[0] ? @current[0] += 1 : @current[0] -= 1
        end
        until @current[1] == goal[1]
            goal[1] > @current[1] ? @current[1] += 1 : @current[1] -= 1
        end
        original[0] < @current[0] ? @path += "E" * (@current[0] - original[0]).abs : @path += "W" * (original[0] - @current[0]).abs
        original[1] < @current[1] ? @path += "N" * (@current[1] - original[1]).abs : @path += "S" * (original[1] - @current[1]).abs
        @path += "D"
    end
end
