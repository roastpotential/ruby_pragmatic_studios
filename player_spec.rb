require_relative 'player'
require_relative 'game'

describe Player do
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
        player1 = Player.new("moe", 100)
        player2 = Player.new("larry", 60)
        player3 = Player.new("curly", 125)
        player4 = Player.new("shemp", 90)

        player1.score.should == (100 + 3)
        player2.score.should == (60 + 5)
        player3.score.should == (125 + 5)
        player4.score.should == (90 + 5)
    end

    it "increases health by 15 when w00ted" do
        player1 = Player.new("moe", 100)
        player1.w00t

        player2 = Player.new("larry", 60)
        player2.w00t

        player3 = Player.new("curly", 125)
        player3.w00t
        
        player4 = Player.new("shemp", 90)
        player4.w00t

        player1.health.should == 100 + 15
        player2.health.should == 60 + 15
        player3.health.should == 125 + 15
        player4.health.should == 90 + 15
    end

    it "decreases health by 10 when w00ted" do
        player1 = Player.new("moe", 100)
        player1.blam

        player2 = Player.new("larry", 60)
        player2.blam

        player3 = Player.new("curly", 125)
        player3.blam
        
        player4 = Player.new("shemp", 90)
        player4.blam

        player1.health.should == 100 - 10
        player2.health.should == 60 - 10
        player3.health.should == 125 - 10
        player4.health.should == 90 - 10
    end
end