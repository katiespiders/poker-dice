require_relative '../poker_dice'

describe PokerDice::Die do
  let(:die) {PokerDice::Die.new}

  specify "creates a die" do
    expect(die.class).to eq PokerDice::Die
  end

  specify "creates FACES array constant" do
    expect(PokerDice::Die::FACES.class).to eq Array
  end

  specify "creates die with top face in FACES array" do
    expect(PokerDice::Die::FACES).to include(die.top_face)
  end
end

describe PokerDice::Hand do
  describe "with random dice"
    let(:hand) {PokerDice::Hand.new}

    specify "creates a hand with length 5" do
      expect(hand.dice.class).to eq Array
      expect(hand.dice.length).to eq 5
    end

    specify "adds string objects to hand" do
      expect(hand.dice[3].class).to eq String
    end

    specify "adds string representing a valid face" do
      expect(PokerDice::Die::FACES).to include(hand.dice[3])
    end

    specify "creates a hash of cards and their count" do
      expect(hand.counts_hash.class).to eq Hash
    end
  end

describe PokerDice::Hand do
  describe "with loaded dice" do

    def hand_with(face_values)
      dice = face_values.map { |value| PokerDice::LoadedDie.new(value).top_face }
      PokerDice::Hand.new( dice )
    end

    it "counts_hash returns a hash" do
      hand = hand_with(%w[ Q Q Q Q Q ])
      expect(hand.counts_hash.class).to eq Hash
    end

    it "straight? returns true for the 2 possible values" do
      hand = hand_with(%w[ 9 T J Q K])
      expect(hand.straight?).to eq true
      hand = hand_with(%w[ T J Q K A])
      expect(hand.straight?).to eq true
    end

    it "scores returns five of a kind" do
      hand = hand_with(%w[ J J J J J])
      expect(hand.scores(hand.counts_hash)).to eq "five of a kind"
    end

    it "scores returns four of a kind" do
      hand = hand_with(%w[ J J J J T])
      expect(hand.scores(hand.counts_hash)).to eq "four of a kind"
    end

    it "scores returns full house" do
      hand = hand_with(%w[ J J J Q Q])
      expect(hand.scores(hand.counts_hash)).to eq "full house"
    end

    it "scores returns three of a kind" do
      hand = hand_with(%w[ J J J Q K])
      expect(hand.scores(hand.counts_hash)).to eq "three of a kind"
    end

    it "scores returns two pairs" do
      hand = hand_with(%w[J J Q Q K])
      expect(hand.scores(hand.counts_hash)).to eq "two pairs"
    end

    it "scores returns one pair" do
      hand = hand_with(%w[J J Q K A])
      expect(hand.scores(hand.counts_hash)).to eq "one pair"
    end

    it "scores returns bust" do
      hand = hand_with(%w[9 T J K A])
      expect(hand.scores(hand.counts_hash)).to eq "bust"
    end

  end
end
