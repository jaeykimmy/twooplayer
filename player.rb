class Player
  attr_accessor :name, :lives, :turn
  
    def initialize(name)
        @name = name
        @lives = 3
        @turn = false
        puts "Initialized new player #{name}"
    end

    def decrement_lives
      @lives -= 1
      puts "#{name} lost one life and has #{lives} left"
    end


end



# james = Player.new('James')
# puts james.name, james.lives
# james.decrement_lives
# pp james

