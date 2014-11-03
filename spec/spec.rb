require_relative 'poker_dice'

describe PokerDice::Die do

  it "creates a die" do
    expect(Die.new.class).to eq Die
  end

end
