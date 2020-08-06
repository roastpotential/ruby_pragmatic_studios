require 'knuckleheads/player'
require 'knuckleheads/game'
require 'knuckleheads/game_turn_module'
require 'knuckleheads/die'
require 'knuckleheads/treasure_trove'

module KnuckleheadsGame

    describe Player do

        before do
            @initial_health1 = 100
            @initial_health2 = 60
            @initial_health3 = 125
            @initial_health4 = 90
        end

        it "has capitalized name" do
            player1 = KnuckleheadsGame::Player.new("moore", 100)
            player2 = KnuckleheadsGame::Player.new("larry", 60)
            player3 = KnuckleheadsGame::Player.new("curly", 125)
            player4 = KnuckleheadsGame::Player.new("shemp", 90)

            player1.name.should == "Moore"
            player2.name.should == "Larry"
            player3.name.should == "Curly"
            player4.name.should == "Shemp"
        end

        it "has a health value of" do
            player1 = KnuckleheadsGame::Player.new("moore", 100)
            player2 = KnuckleheadsGame::Player.new("larry", 60)
            player3 = KnuckleheadsGame::Player.new("curly", 125)
            player4 = KnuckleheadsGame::Player.new("shemp", 90)
        
            player1.health.should == 100
            player2.health.should == 60
            player3.health.should == 125
            player4.health.should == 90
        end

        it "computes a score as the sum of its health and points" do
            player1 = KnuckleheadsGame::Player.new("moore", @initial_health1)

            player1.found_treasures(KnuckleheadsGame::Treasure.new(:bow, 25))

            player1.score.should == (@initial_health1 + 25)
        end

        it "computes points as the sum of all treasure points" do
            player1 = KnuckleheadsGame::Player.new("moore", @initial_health1)
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:ration, 5))
            player1.points.should == 5

            player1.found_treasures(KnuckleheadsGame::Treasure.new(:bow, 25))
            player1.points.should == 30

            player1.found_treasures(Treasure.new(:gemstone, 100))
            player1.points.should == 130
                
        end

        it "increases health by 15 when w00ted" do
            player1 = KnuckleheadsGame::Player.new("moore", @initial_health1)
            player1.w00t

            player2 = KnuckleheadsGame::Player.new("larry", @initial_health2)
            player2.w00t

            player3 = KnuckleheadsGame::Player.new("curly", @initial_health3)
            player3.w00t
            
            player4 = KnuckleheadsGame::Player.new("shemp", @initial_health4)
            player4.w00t

            player1.health.should == @initial_health1 + 15
            player2.health.should == @initial_health2 + 15
            player3.health.should == @initial_health3 + 15
            player4.health.should == @initial_health4 + 15
        end

        it "decreases health by 10 when w00ted" do
            player1 = KnuckleheadsGame::Player.new("moore", @initial_health1)
            player1.blam

            player2 = KnuckleheadsGame::Player.new("larry", @initial_health2)
            player2.blam

            player3 = KnuckleheadsGame::Player.new("curly", @initial_health3)
            player3.blam
            
            player4 = KnuckleheadsGame::Player.new("shemp", @initial_health4)
            player4.blam

            player1.health.should == @initial_health1 - 10
            player2.health.should == @initial_health2 - 10
            player3.health.should == @initial_health3 - 10
            player4.health.should == @initial_health4 - 10
        end

        it "yields each found treasure and its total points" do
            player1 = KnuckleheadsGame::Player.new("moore", @initial_health1)

            player1.found_treasures(KnuckleheadsGame::Treasure.new(:gemstone, 100))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:gemstone, 100))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:potion, 50))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:ration, 5))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:ration, 5))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:ration, 5))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:ration, 5))
            player1.found_treasures(KnuckleheadsGame::Treasure.new(:ration, 5))

            yielded = []
            player1.each_found_treasure do |treasure|
                yielded << treasure
            end

            yielded.should == [
                KnuckleheadsGame::Treasure.new(:gemstone, 200),
                KnuckleheadsGame::Treasure.new(:potion, 50),
                KnuckleheadsGame::Treasure.new(:ration, 25)
            ]
        end

        it "can be created from a CSV string" do
            player = KnuckleheadsGame::Player.from_csv("moore,100")
            
            player.name.should == "Moore"
            player.health.should == 100
        end 

        context "with a health greater than 100" do
            before do
                @player = KnuckleheadsGame::Player.new("curly", @initial_health3)
            end

            it "is strong" do
                @player.should be_strong
            end
        end

        context "with a health of 100 or less" do
            before do
                @player = KnuckleheadsGame::Player.new("moore", @initial_health1)
                @player = KnuckleheadsGame::Player.new("larry", @initial_health2)
                @player = KnuckleheadsGame::Player.new("shemp", @initial_health4)
            end 

            it "is wimpy" do
                @player.should_not be_strong
            end
        end
    end
end