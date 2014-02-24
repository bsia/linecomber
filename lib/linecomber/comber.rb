
module Linecomber
  class Comber
    def self.comb(lines, filters)
      ret = ""
      capture = true if filters.length > 0 
      lines.split("\n").each do |l|
        if capture then
          ret = ret + l
        end
      end
      ret
    end
  end
end

