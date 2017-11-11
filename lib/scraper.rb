require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './player.rb'

class Scraper
  attr_accessor :names

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

  end

  def get_player_page(player)
    Nokogiri::HTML(open("https://rankings.the-elite.net/~#{player}/goldeneye"))
  end

  def valid_times?(data)
    !data.css(".time").text.include?("N/A")
  end

  def player_overall_time(data)
    numbers = data.css(".overall").first.text.split(" ")[3]
  end

  def verify_players
    self.collect_player_names

    temp = @names.length - 1
    tempa = temp - 10
    # binding.pry
    @names.each do |n|
    # @names[0..10].each do |n|
      doc = self.get_player_page(n)
      if self.valid_times?(doc)
        Player.new(n, self.player_overall_time(doc))
      end
    end

  end

end

Scraper.new.verify_players
# binding.pry
Player.slowest
