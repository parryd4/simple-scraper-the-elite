class Player
  attr_accessor :user_name, :total_time

  @@all = []

  def initialize(user_name, total_time)
    @user_name = user_name
    @total_time = total_time
    @@all << self
  end

  def self.all
    @@all
  end

  def self.slowest
    slowest = @@all.sort_by { |p| p.total_time }
    # binding.pry
    puts "The slowest overall time for all levels completed is: #{slowest.last.total_time}"
  end

end
