require_relative 'player'

module KnuckleheadsGame

    class BerserkerPlayer < Player
        
        def initialize(name, health=100)
            super(name, health)
            @w00t_count = 0
        end
        
        def berserk?
            @w00t_count > 5
        end


        def w00t
            super
            @w00t_count += 1
            puts "#{@name} is going berserk!!" if berserk?
        end

        if __FILE__ == $0
            berserker = KnuckleheadsGame::BerserkPlayer.new("berserker", 50)
            6.times { berserker.w00t }
            2.times { berserker.blam }

            puts berserker.health
        end

        def blam 
            if berserk?
                w00t
            else
                super
            end
        end
   
    end
end