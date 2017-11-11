require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './player.rb'

class Scraper

  def initialize
    @names = []
  end

  def get_ajax_page
    Nokogiri::HTML(open("https://rankings.the-elite.net/ajax/rankings/ge/post50/1510367957)"))
  end

  def collect_player_names
    text = self.get_ajax_page.css("p").children.text

    # this messy string has 2 colons, anything after the 2nd is time data and we can split further by commas
    data = text.split(":").last.split(",")
    @names = data.values_at(* data.each_index.select{ |i| (i-1)%6 == 0})
    @names.map! { |n| n[1..-2]}

    binding.pry
  end

  def get_player_page
    
  end

  def look_for_invalid_time

  end

  def verify_players

  end

end

Scraper.new.collect_player_names
