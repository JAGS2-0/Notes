require 'rspec'
require_relative 'xos'

describe XOs do

  it 'can fill up the board' do # i fill up the board
    x = XOs.new

    expect(x.board_full?).to eq false

    # I fill up the board
    (1 .. 9).each do |pos|
      x.take_turn 'O', pos
    end

    expect(x.board_full?).to eq true
  end

  # it 'rejects out-of-bounds moves'
  # it 'rejects squares that are already taken'

  it 'can see an empty square' do
    x = XOs.new

    expect(x.letter_at 7).to eq nil
  end

  it 'can take one turn' do # i take one turn by placing an X at position 3 and then it is visible on the board
    x = XOs.new

    x.take_turn('X', 3)

    expect(x.turns_left).to eq 8
    expect(x.letter_at 3).to eq 'X'
  end

  it 'finds three in a row' do
    x = XOs.new

    x.take_turn('X', 5)
    x.take_turn('X', 4)
    x.take_turn('X', 6)

    expect(x.winner).to eq 'X'
  end

end