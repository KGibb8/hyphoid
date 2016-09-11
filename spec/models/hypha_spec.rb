require './spec/spec_helper'

describe Mycelium do

  before do
    extend SeedData
  end

  it "should mine resources" do

  end

    expect(@mycelium1.resources).to eq()
    # TODO: As it stands we're not entirely sure what the purpose of the hypha
    # is as we aren't yet sure how they interact with their environment
  end
