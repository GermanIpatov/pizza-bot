class Parser

    def self.get_size_of_field(given_str)
        size_of_field_arr = given_str.strip.slice(0...given_str.index("(")).tr("x", " ").split(" ").map{|i| i.to_i}
        return size_of_field_arr
    end

    def self.get_coordinates_arr(given_str)
        coord = given_str.slice(given_str.index("(") + 1...given_str.length - 1).split(")(").map{|i| i.split(", ")}.each{|i| i[0], i[1] = i[0].to_i, i[1].to_i}
        return coord
    end

end