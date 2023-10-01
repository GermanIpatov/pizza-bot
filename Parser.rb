class Parser

    def self.get_size_of_field(given_str)
        given_str.strip.split("(").first.split("x").map{|i| i.to_i}
    end

    def self.get_coordinates_arr(given_str)
        given_str.slice(given_str.index("(") + 1...-1).split(")(").map{|i| i.split(", ").map(&:to_i)}
    end

end