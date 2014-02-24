
module Linecomber
  class Comber

    def self.comb_each(line_collection, filters, processors)
      collated = ""
      line_collection.each_line do |l|
        ret = process_line(l, filters, @@processors)
        collated = "#{collated}#{ret}" unless ret.nil?
      end
      collated 
    end

    def self.comb_lines(lines, filters)
      @@processors = [ method(:begin_processor), method(:print_processor), method(:end_processor) ]
      init_begin_end_processors
      comb_each(lines, filters, @@processors)
    end

    def self.process_line(line, filters, processors)
      ret = ""
      processors.each do |p|
        ret = p.call(line, filters)
        return nil if ret.nil?
        return ret unless ret.eql? line
      end
      ret
    end

    def self.init_begin_end_processors
      @@begin_printing = false
    end

    def self.begin_processor(line, filters)
      if line =~ filters[:begin] then
        @@begin_printing = true
      end
      line
    end

    def self.end_processor(line, filters)
      if line =~ filters[:end] then
        @@begin_printing = false
      end
      line
    end

    def self.print_processor(line, filters)
      if @@begin_printing then
        line
      else
        nil 
      end
    end

    def self.comb(filename, filters)
      File.open(filename, "r") do |handle|
        comb_lines(handle, filters)
      end
    end
  end
end

