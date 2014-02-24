require 'linecomber/comber'

describe Linecomber::Comber do
  context "when lines are empty" do
    it "should return blank lines" do
      Linecomber::Comber.comb("",{}).should eql("")
    end
    it "it should return blank when filter has one entry" do
      Linecomber::Comber.comb("", { :something => /Test/ }).should eql("")
    end
  end


  it "should return blank line when filter has no entry" do
    Linecomber::Comber.comb("Display this", {}).should eql("")
  end

  context "when there is a beginMark-endMark filter" do
    filter = { :begin => /^Class.*{/, :end => /^};/ }
    it "should return only lines within begin and end matchers" do
      data = "Bogus\nClass something {\nint x;\n};\nBogus At End\n"
      Linecomber::Comber.comb(data, filter).should eql("Class something {\nint x;\n};\n")
    end

  end


end

