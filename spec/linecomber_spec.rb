require 'linecomber/comber'

describe Linecomber::Comber do
  it "lines are empty" do
    Linecomber::Comber.comb("",[]).should eql("")
  end

  it "lines are empty, filter has one entry" do
    Linecomber::Comber.comb("", [ /Class descriptor.*;/]).should eql("")
  end

  it "one line, filter has no entry" do
    Linecomber::Comber.comb("Display this", [ ]).should eql("Display this")
  end

end

