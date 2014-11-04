module PokerDice
  class Die
    FACES = %w[ 9 T J Q K A ]

    attr_reader :top_face

    def initialize
      roll
    end

    def roll
      @top_face = FACES[ rand(0..5) ]
    end
  end

  class LoadedDie
    attr_reader :top_face

    def initialize(top_face)
      @top_face = top_face
    end
  end

  class Hand
    attr_accessor :dice

    def initialize(dice = [])
      @dice = dice
      if @dice == []
        5.times { @dice << Die.new.top_face }
      end

      straight?
      counts_hash

    end

    def straight?
      sorted_dice = @dice.sort
      (sorted_dice == %w[9 J K Q T]) || (sorted_dice == %w[ A J K Q T])
    end

    def counts_hash
      count = 0
      card_hash = {}
      for card in @dice
        count = @dice.count {|x| x == card }
        card_hash[card] = count
      end
      card_hash
    end

    def scores(hash)
      @score = case
      when hash.values.include?(5) ; "five of a kind"
      when hash.values.include?(4) ; "four of a kind"
      when hash.values.include?(3)
        if hash.values.include?(2)
          "full house"
        else
          "three of a kind"
        end
      when hash.values.count(2) == 2 ; "two pairs"
      when hash.values.count(2) == 1 ; "one pair"
      else
        "bust"
      end
    end
  end
end
