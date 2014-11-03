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

    end
  end
end
