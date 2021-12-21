class Board
  attr_reader(:size)
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n*n
  end

  def [](pos)
    row,column=pos
    @grid[row][column]
  end

  def []=(pos,val)
    row,column=pos
    @grid[row][column]=val
  end

  def num_ships
    count = 0
    @grid.each do |subarr|
      subarr.each do |num|
        if num == :S
          count += 1
        end
      end
    end
    count
  end

  def attack(pos)
    if self[pos]==:S
      self[pos]=:H
      puts "you sunk my battleship!"
      return true
    else
      self[pos]=:X
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25
    while self.num_ships < total_ships
      row=rand(0...@grid.size)
      column=rand(0...@grid.size)
      position=[row,column]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def cheat
    p Board.print_grid(@grid)
  end
  
  def print
    p Board.print_grid(self.hidden_ships_grid)
  end

end
