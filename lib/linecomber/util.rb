
module Linecomber
  class Util 
    def self.create_filters(h)
      h.keys.each do |key|
        h[(key.to_sym rescue key) || key] = Regexp.new(h.delete(key))
      end
      h
    end
  end
end

