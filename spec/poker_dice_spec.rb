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

end
