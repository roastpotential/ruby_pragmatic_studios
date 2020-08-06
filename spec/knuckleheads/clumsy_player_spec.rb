require 'knuckleheads/player'
require 'knuckleheads/treasure_trove'
require 'knuckleheads/clumsy_player'

module KnuckleheadsGame

    describe ClumsyPlayer do
        
        before do 
            @player = KnuckleheadsGame::ClumsyPlayer.new("klutz")
        end 

        it "only gets half the point value of each treasure" do
            @player.points.should == 0

            # potion = Treasure.new(:potion, 50)
            # @player.found_treasures(potion)
            # @player.found_treasures(potion)
            # @player.found_treasures(potion)

            # @player.points.should == 75

            strange_weapon = KnuckleheadsGame::Treasure.new(:strange_weapon, 200.0)
            @player.found_treasures(strange_weapon)
            @player.found_treasures(strange_weapon)

            @player.points.should == 200.0

            yielded = []
            @player.each_found_treasure do |treasure|
                yielded << treasure
            end

            yielded.should == [KnuckleheadsGame::Treasure.new(:strange_weapon, 200.0)]
        end

    end
end