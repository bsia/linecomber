
module Linecomber
  class Comber
    def self.comb(lines, filters)
     
      ret = ""
      lines.split("\n").each do |l|
        ret = ret + l 
      end
      ret
    end
  end
end

