#!/usr/bin/env ruby

module PageRank
  def self.calculate_rank(links = {})
    damping_factor = 0.85
    sum = 0
    links.each do |k|
      sum += k[:page_rank].to_f / k[:number_of_outgoing_links].to_i
    end
    (1 - damping_factor) + damping_factor * sum
  end
end

current_key = nil
incoming_links = []

STDIN.each do |line|
  key, value = line.chomp.split(/\t/, 2)
  incoming_link, page_rank, number_of_outgoing_links = value.split(/ /)
  if !current_key
    current_key = key
  elsif current_key != key and not incoming_links.empty?
    rank = PageRank.calculate_rank incoming_links
    puts key + "\t" + rank.to_s + " " + incoming_links.map{|x| x[:url]}.join(' ')
    current_key = key
    incoming_links = []
  end
  incoming_links << {
    :url => incoming_link,
    :page_rank => page_rank,
    :number_of_outgoing_links => number_of_outgoing_links
  }
end
