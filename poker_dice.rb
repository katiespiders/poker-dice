module PokerDice
  class Die
    FACES = %w[ 9 T J Q K A ]
    # FACES.collect! { |k, v| }

    attr_reader :top_face

    def initialize
      roll
    end

    def roll
      @top_face = FACES[ rand(0..5) ]
    end
  end

  class Hand
    attr_accessor :dice

    def initialize
      @dice = []
      5.times { @dice << Die.new.top_face }

      straight?
      matches?

    end

    def straight?

    end

    def matches?
      count = 0
      card_hash = {}
      for card in @dice
        count = @dice.count {|x| x == card }
        # if count > 1
          card_hash[card] = count
        # end
      end
      puts card_hash
      card_hash
    end

    def hands(hash)
      for item in hash

      end
    end

  end
end
