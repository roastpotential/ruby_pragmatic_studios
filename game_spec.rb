require_relative 'game'
require_relative 'player'

describe Game do
    it "has a capitalized title" do
        knuckleheads = Game.new("knuckleheads")

        knuckleheads.title.should == "Knuckleheads"
    end

    it "has a string representation" do
        player1 = Player.new("moe", 100)
        player2 = Player.new("larry", 60)
        player3 = Player.new("curly", 125)
        player4 = Player.new("shemp", 90)
    
        player1.to_s.should == "I'm Moe with a health of 100; my score is 103.\n\t"
        player2.to_s.should == "I'm Larry with a health of 60; my score is 65.\n\t"
        player3.to_s.should == "I'm Curly with a health of 125; my score is 130.\n\t"
        player4.to_s.should == "I'm Shemp with a health of 90; my score is 95.\n\t"
    end

end