require 'knuckleheads/berserker_player'
require 'knuckleheads/player'

module KnuckleheadsGame

    describe BerserkerPlayer do
        
        before do
            @initial_health = 50
            @player = KnuckleheadsGame::BerserkerPlayer.new("berserker", @initial_health)            
        end

        it "does not go bersek when w00ted up to 5 times" do
            1.upto(5) { @player.w00t }

            @player.berserk?.should be_falsey
        end

        it "goes berserk when w00ted more than 5 times" do
            1.upto(6) { @player.w00t }

            @player.berserk?.should be_truthy
        end

        it "gets w00ted instead of blammed when it's gone berserk" do
            1.upto(6) { @player.w00t }
            1.upto(2) { @player.blam }

            @player.health.should == @initial_health + (8 * 15)
        end

    end
end