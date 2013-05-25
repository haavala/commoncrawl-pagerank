#!/usr/bin/env ruby
require 'rubygems'

STDIN.each do |line|
  key, value = line.chomp.split(/\t/, 2)

  page_rank, outgoing_links = value.split(/ /, 2)

  links = outgoing_links.split(/ /)

  links.each do |link|
    puts link + "\t" + key + " " + page_rank + " " + links.size.to_s
  end
end