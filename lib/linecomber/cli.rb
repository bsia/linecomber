require 'thor'
require 'linecomber/comber'

module Linecomber
  class CLI < Thor


    desc "comb", "Comb through a file and dump the output based on a set of filters"
    method_option :filters, :type => :array, :aliases => "-i"
    method_option :file, :type => :string, :aliases => "-f"
    def comb
      filename = options[:file]
      puts "filename is: #{options[:file]}"
      puts Linecomber::Comber.comb(filename, {})
    end
  end
end

