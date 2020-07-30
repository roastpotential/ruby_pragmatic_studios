require_relative 'game'
require_relative 'player'
require_relative 'die'

describe Game do
    before do
        @game = Game.new("knuckleheads")

        @initial_health1 = 100
        @initial_health2 = 60
        @initial_health3 = 125
        @initial_health4 = 90

        player1 = Player.new("moore", @initial_health1)
        player2 = Player.new("larry", @initial_health2)
        player3 = Player.new("curly", @initial_health3)
        player4 = Player.new("shemp", @initial_health4)

        @game.add_player(player1)
        @game.add_player(player2)
        @game.add_player(player3)
        @game.add_player(player4)
    end

    it "has a capitalized title" do
        knuckleheads = Game.new("knuckleheads")

        knuckleheads.title.should == "*********Knuckleheads*********"
    end

    it "has a string representation" do
        @game.players[0].to_s.should == "I'm Moore with a health of 100; my score is 100, and my treasure value is 0.\n\t"
        @game.players[1].to_s.should == "I'm Larry with a health of 60; my score is 60, and my treasure value is 0.\n\t"
        @game.players[2].to_s.should == "I'm Curly with a health of 125; my score is 125, and my treasure value is 0.\n\t"
        @game.players[3].to_s.should == "I'm Shemp with a health of 90; my score is 90, and my treasure value is 0.\n\t"
    end

    it "w00ts the player if a high number is rolled" do
        Die.any_instance.stub(:roll).and_return(5)

        @game.play(3)
        
        @game.players[0].health.should == @initial_health1 + (15 * 3)
        @game.players[1].health.should == @initial_health2 + (15 * 3)
        @game.players[2].health.should == @initial_health3 + (15 * 3)
        @game.players[3].health.should == @initial_health4 + (15 * 3)
    end

    it "skips the player if a medium number is rolled" do
        Die.any_instance.stub(:roll).and_return(3)

        @game.play(3)

        @game.players[0].health.should == @initial_health1
        @game.players[1].health.should == @initial_health2
        @game.players[2].health.should == @initial_health3
        @game.players[3].health.should == @initial_health4
    end

    it "blams the player if a low number is rolled" do
        Die.any_instance.stub(:roll).and_return(1)
      
        @game.play(3)
      
        @game.players[0].health.should == @initial_health1 - (10 * 3)
        @game.players[1].health.should == @initial_health2 - (10 * 3)
        @game.players[2].health.should == @initial_health3 - (10 * 3)
        @game.players[3].health.should == @initial_health4 - (10 * 3)
      end
      
      it "assigns a treasure for points during a player's turn" do
        game = Game.new("Knuckleheads")
        player1 = Player.new("moore", @initial_health1)

        game.add_player(player1)
        game.play(1)

        player1.points.should_not be_zero
      end
end