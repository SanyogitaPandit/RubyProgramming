class Position
    attr_accessor :x, :y

    def initialize (row = 0, col = 0)
        @x, @y = row, col
    end

    def valid?
        if ((0..7).include?(@x)) && ((0..7).include?(@y))
            return true
        else
            return false
        end
    end

    def ==(obj)
        if obj.is_a? Position
            return (@x == obj.x) && (@y == obj.y)
        end

        return false
    end
end