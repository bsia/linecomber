require 'iconv'

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
#      @@processors = [ method(:begin_processor), method(:print_processor), method(:end_processor), method(:default_processor) ]
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
      @@begin_printing = true if match_line(line, filters[:begin])
      line
    end

    def self.end_processor(line, filters)
      @@begin_printing = false if match_line(line, filters[:end])
      line
    end

    def self.print_processor(line, filters)
      if @@begin_printing then
        line
      else
        nil 
      end
    end

    def self.default_processor(line, filters)
      return line if line =~ filters[:default]
      nil
    end

    def self.comb(filename, filters)
      File.open(filename, "r") do |handle|
        comb_lines(handle, filters)
      end
    end

    def self.match_line(line, matcher)
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      valid_string = ic.iconv(line + ' ')[0..-2]
      valid_string =~ matcher
    end
  end
end

