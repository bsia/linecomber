require 'linecomber/comber'

describe Linecomber::Comber do
  context "when lines are empty" do
    it "should return blank lines" do
      Linecomber::Comber.comb_lines("",{}).should eql("")
    end
    it "it should return blank when filter has one entry" do
      Linecomber::Comber.comb_lines("", { :something => /Test/ }).should eql("")
    end
  end


  it "should return blank line when filter has no entry" do
    Linecomber::Comber.comb_lines("Display this", {}).should eql("")
  end

  context "when there is a beginMark-endMark filter" do
    filter = { :begin => /^class.*{/, :end => /^};/ }
    it "should return only lines within begin and end matchers" do
      data = "Bogus\nclass something {\n    int x;\n};\nBogus At End\n"
      Linecomber::Comber.comb_lines(data, filter).should eql("class something {\n    int x;\n};\n")
    end

    it "should read a file and return only contents within begin and end matchers" do
      Linecomber::Comber.comb(get_test_file, filter).should eql("class something {\n    int x;\n};\n")
    end

  end


  def get_test_file
    File.join(Dir.getwd, "test_data", "test_file.txt")
  end

end

