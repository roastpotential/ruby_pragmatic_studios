Treasure = Struct.new(:name, :points)

module TreasureTrove
    TREASURES = [
        Treasure.new(:ration,   5.0),
        # rations are 5sp; 10sp = 1gp, so 10 rations are 5g)
        Treasure.new(:bow, 25.0),
        # simple ranged weapon of the person's proficiency (crossbow or shortbow)
        Treasure.new(:potion,   50.0),
        # 1 potion of health = 50gp
        Treasure.new(:gemstone,  100.0),
        # one of the 100gp gemstones is here as a reward: amber, amethyst, chrysoberyl, coral, garnet, jade, jet, pearl, spinel, tourmaline
        Treasure.new(:strange_armor,  200.0),
        # armor of the person's proficiency that gives them +1 to their AC
        Treasure.new(:strange_weapon, 200.0),
        # weapon of the person's proficiency that gives them +1 to their attack rolls; considered magical
        Treasure.new(:rare_armor,  400.0),
        # armor of the person's proficiency that gives them +2 to their AC
        Treasure.new(:rare_weapon, 400.0)
        # weapon of the person's proficiency that gives them +2 to their attack rolls; considered magical
    ]

    def self.random
        TREASURES.sample
    end
end