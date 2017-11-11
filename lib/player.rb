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
    puts "#{slowest.last.user_name} has a total time of #{slowest.last.total_time}"
  end

end
