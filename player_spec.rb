require_relative 'player'
require_relative 'game'

describe Player do

    before do
        @initial_health1 = 100
        @initial_health2 = 60
        @initial_health3 = 125
        @initial_health4 = 90
    end

    it "has capitalized name" do
        player1 = Player.new("moe", 100)
        player2 = Player.new("larry", 60)
        player3 = Player.new("curly", 125)
        player4 = Player.new("shemp", 90)

        player1.name.should == "Moe"
        player2.name.should == "Larry"
        player3.name.should == "Curly"
        player4.name.should == "Shemp"
    end

    it "has a health value of" do
        player1 = Player.new("moe", 100)
        player2 = Player.new("larry", 60)
        player3 = Player.new("curly", 125)
        player4 = Player.new("shemp", 90)
    
        player1.health.should == 100
        player2.health.should == 60
        player3.health.should == 125
        player4.health.should == 90
    end

    it "computes a score as the sum of its health and length of name" do
        player1 = Player.new("moe", @initial_health1)
        player2 = Player.new("larry", @initial_health2)
        player3 = Player.new("curly", @initial_health3)
        player4 = Player.new("shemp", @initial_health4)

        player1.score.should == (@initial_health1 + 3)
        player2.score.should == (@initial_health2 + 5)
        player3.score.should == (@initial_health3 + 5)
        player4.score.should == (@initial_health4 + 5)
    end

    it "increases health by 15 when w00ted" do
        player1 = Player.new("moe", @initial_health1)
        player1.w00t

        player2 = Player.new("larry", @initial_health2)
        player2.w00t

        player3 = Player.new("curly", @initial_health3)
        player3.w00t
        
        player4 = Player.new("shemp", @initial_health4)
        player4.w00t

        player1.health.should == @initial_health1 + 15
        player2.health.should == @initial_health2 + 15
        player3.health.should == @initial_health3 + 15
        player4.health.should == @initial_health4 + 15
    end

    it "decreases health by 10 when w00ted" do
        player1 = Player.new("moe", @initial_health1)
        player1.blam

        player2 = Player.new("larry", @initial_health2)
        player2.blam

        player3 = Player.new("curly", @initial_health3)
        player3.blam
        
        player4 = Player.new("shemp", @initial_health4)
        player4.blam

        player1.health.should == @initial_health1 - 10
        player2.health.should == @initial_health2 - 10
        player3.health.should == @initial_health3 - 10
        player4.health.should == @initial_health4 - 10
    end

    context "with a health greater than 100" do
        before do
            @player = Player.new("curly", @initial_health3)
        end

        it "is strong" do
            @player.should be_strong
        end
    end

    context "with a health of 100 or less" do
        before do
            @player = Player.new("shemp", @initial_health4)
        end 

        it "is wimpy" do
            @player.should_not be_strong
        end
    end
end