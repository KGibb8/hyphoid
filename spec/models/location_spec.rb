require './spec/spec_helper'

describe Location do

  before do
    extend SeedData
  end

  it "should not contain more than one mycelium or tree" do
    @b4.update(mycelium: @mycelium2)
    expect(@b4.errors.messages.keys).to include(:mycelium)
    expect(@b4.errors.messages[:mycelium]).equal?(["A location cannot contain more than one mycelium"])
  end

end
