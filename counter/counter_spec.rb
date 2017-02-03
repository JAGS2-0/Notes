require 'rspec'
require_relative 'counter.rb'

describe Counter do
  it 'increments' do  #each 'it' statement has a block that describes the test, use Ruby in the block
    # Setup / Given
    c = Counter.new

    # Exercise / When  #This is what the class is doing
    c.up
    c.up

    # Expectation / Then
    expect(c.count).to eq 2  # this is what you anticipate the result to be should your test work
  end

  it 'can start with a non-zero value' do
    c = Counter.new(5)

    c.up

    expect(c.count).to eq 6
  end

  it 'can reset' do  #
    c = Counter.new(5)

    c.reset

    expect(c.count).to eq 0
  end
end