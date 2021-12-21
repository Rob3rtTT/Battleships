class Player
    def get_move
    puts "enter a position with coordinates separated with a space like '4 7'"
    input = gets.chomp
    coordinates = input.split(" ")
    coordinates.map {|ele| ele.to_i}
    end
end

#alternative:
# gets.chomp.split(" ").map(&:to_i)