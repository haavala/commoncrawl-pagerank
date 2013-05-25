#!/usr/bin/env ruby
require 'rubygems'
require 'json'

STDIN.each do |line|
  warn line
  # Commoncrawl metadata file starts with url, followed by the tag character and metadata data in JSON format
  # Page url is the key
  key, value = line.chomp.split(/\t/, 2)
  links = []
  if value
    begin
      json = JSON.parse(value.to_s)
      if json and json['content']
        links = json['content']['links']
      end
    rescue JSON::ParserError => p
      warn "JSON parse error: \n #{p.inspect}"
    end
  end
  out_links = []
  if links
    links.each do |l|
      out_links <<  l['href'] if l['type']== 'a'
    end
  end
  if key and key != ''
    puts key + "\t" + out_links.uniq.join(' ')
  end
end
