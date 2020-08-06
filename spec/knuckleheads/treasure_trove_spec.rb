require 'knuckleheads/treasure_trove'

module KnuckleheadsGame

    describe Treasure do

        before do
            @treasure1 = KnuckleheadsGame::Treasure.new(:ration,   5.0)
            @treasure2 = KnuckleheadsGame::Treasure.new(:bow,    25.0)
            @treasure3 = KnuckleheadsGame::Treasure.new(:potion,  50.0)
            @treasure4 = KnuckleheadsGame::Treasure.new(:gemstone,    100.0)
            @treasure5 = KnuckleheadsGame::Treasure.new(:strange_armor,  200.0)
            @treasure6 = KnuckleheadsGame::Treasure.new(:strange_weapon, 200.0)
            @treasure7 = KnuckleheadsGame::Treasure.new(:rare_armor, 400.0)
            @treasure8 = KnuckleheadsGame::Treasure.new(:rare_weapon, 400.0)
        end 

        it "has a name attribute" do
            @treasure1.name.should == :ration
            @treasure2.name.should == :bow
            @treasure3.name.should == :potion
            @treasure4.name.should == :gemstone
            @treasure5.name.should == :strange_armor
            @treasure6.name.should == :strange_weapon
            @treasure7.name.should == :rare_armor
            @treasure8.name.should == :rare_weapon
        end

        it "has a value attribute" do
            @treasure1.points.should == 5.0
            @treasure2.points.should == 25.0
            @treasure3.points.should == 50.0
            @treasure4.points.should == 100.0
            @treasure5.points.should == 200.0
            @treasure6.points.should == 200.0
            @treasure7.points.should == 400.0
            @treasure8.points.should == 400.0
        end
    end

    describe TreasureTrove do

        it "has eight treasures" do
            TreasureTrove::TREASURES.size.should == 8
        end
        
        it "has a ration, with a 5 value" do
            TreasureTrove::TREASURES[0].should == KnuckleheadsGame::Treasure.new(:ration, 5.0)
                # rations are 5sp; 10sp = 1gp, so 10 rations are 5g
        end

        it "has a ranged weapon, with a 25 value" do
            TreasureTrove::TREASURES[1].should == KnuckleheadsGame::Treasure.new(:bow,   25.0)
                # simple ranged weapon of the person's proficiency (crossbow or shortbow); 25 gp
        end

        it "has a health potion, with a 50 value" do
            TreasureTrove::TREASURES[2].should == KnuckleheadsGame::Treasure.new(:potion, 50.0)
                # 1 potion of health = 50gp
        end

        it "has a gemstone, with a 100 value" do
            TreasureTrove::TREASURES[3].should == KnuckleheadsGame::Treasure.new(:gemstone,   100.0)
                # one of the 100gp gemstones is here as a reward: amber, amethyst, chrysoberyl, coral, garnet, jade, jet, pearl, spinel, tourmaline
        end

        it "has a +1 armor, with a 200 value" do
            TreasureTrove::TREASURES[4].should == KnuckleheadsGame::Treasure.new(:strange_armor, 200.0)
                # armor of the person's proficiency that gives them +1 to their AC; 200 gp
        end

        it "has a +1 weapon, with a 200 value" do
            TreasureTrove::TREASURES[5].should == KnuckleheadsGame::Treasure.new(:strange_weapon,    200.0)
            # weapon of the person's proficiency that gives them +1 to their attack rolls; considered magical; 200 gp
        end

        it "has a +2 armor, with a 400 value" do
            TreasureTrove::TREASURES[6].should == KnuckleheadsGame::Treasure.new(:rare_armor, 400.0)
                # armor of the person's proficiency that gives them +2 to their AC; 400 gp
        end

        it "has a +2 weapon worth 400 gp" do
            TreasureTrove::TREASURES[7].should == KnuckleheadsGame::Treasure.new(:rare_weapon,    400.0)
                # weapon of the person's proficiency that gives them +2 to their attack rolls; considered magical; 400 gp
        end

        it "returns a random treasure" do
            treasure = TreasureTrove.random

            TreasureTrove::TREASURES.should include(treasure)
        end
    end
end