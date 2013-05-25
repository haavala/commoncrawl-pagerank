#!/usr/bin/env ruby
require 'rubygems'
warn "reduce.rb"
ARGF.each_line do |line|
  #warn "working with line: #{line}"
  line = line.chomp
  key, value = line.split(/\t/)

  if key and value
	   puts key + "\t" + "1.0 " + value
  end

end
