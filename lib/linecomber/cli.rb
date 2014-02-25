require 'thor'
require 'linecomber/comber'
require 'linecomber/util'

module Linecomber
  class CLI < Thor

    desc "comb", "Comb through a file and dump the output based on a set of filters"
    method_option :filters, :type => :hash, :aliases => "-i"
    method_option :file, :type => :string, :aliases => "-f"
    def comb
      filename = File.expand_path(options[:file])
      filters = Linecomber::Util::create_filters options[:filters]
      puts "This is the file = #{filename}"
      puts Linecomber::Comber.comb(filename, filters)
    end


  end
end

