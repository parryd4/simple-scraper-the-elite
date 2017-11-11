require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './player.rb'

class Scraper

  def collect_user_names
    doc = Nokogiri::HTML(open("https://rankings.the-elite.net/ajax/rankings/ge/post50/1510367957)"))
    text = doc.css("p").children.text

    # this messy string has 2 colons, anything after the 2nd is time data and we can split further by commas
    times = text.split(":").last.split(",")
    binding.pry
  end

end

Scraper.new.collect_user_names
