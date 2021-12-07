class School
  attr_reader(:fish)
  def initialize(fish) = @fish = fish

  # okay enough for part1, but not for part2 :/
  def another_day!
    @fish = fish.map { _1 == 0 ? [6, 8] : _1 - 1 }.flatten
  end

  def after!(days)
    fish_count_on_day = [0] * 9 # includes 8th day
    fish.each { fish_count_on_day[_1] += 1 }

    days.times do
      zeros = fish_count_on_day.shift
      fish_count_on_day[6] += zeros
      fish_count_on_day << zeros
    end

    fish_count_on_day.sum
  end
end

def part1(school, days)
  days.times { school.another_day! }
  school.fish.size
end

def part2(school, days)
  school.after!(days)
end

lanternfish = DATA.read.split(",").map(&:to_i)
puts "part 1: %d" % part1(School.new(lanternfish), 80)
puts "part 2: %d" % part2(School.new(lanternfish), 256)


__END__
1,1,1,2,1,5,1,1,2,1,4,1,4,1,1,1,1,1,1,4,1,1,1,1,4,1,1,5,1,3,1,2,1,1,1,2,1,1,1,4,1,1,3,1,5,1,1,1,1,3,5,5,2,1,1,1,2,1,1,1,1,1,1,1,1,5,4,1,1,1,1,1,3,1,1,2,4,4,1,1,1,1,1,1,3,1,1,1,1,5,1,3,1,5,1,2,1,1,5,1,1,1,5,3,3,1,4,1,3,1,3,1,1,1,1,3,1,4,1,1,1,1,1,2,1,1,1,4,2,1,1,5,1,1,1,2,1,1,1,1,1,1,1,1,2,1,1,1,1,1,5,1,1,1,1,3,1,1,1,1,1,3,4,1,2,1,3,2,1,1,2,1,1,1,1,4,1,1,1,1,4,1,1,1,1,1,2,1,1,4,1,1,1,5,3,2,2,1,1,3,1,5,1,5,1,1,1,1,1,5,1,4,1,2,1,1,1,1,2,1,3,1,1,1,1,1,1,2,1,1,1,3,1,4,3,1,4,1,3,2,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,2,1,5,1,1,1,1,2,1,1,1,3,5,1,1,1,1,5,1,1,2,1,2,4,2,2,1,1,1,5,2,1,1,5,1,1,1,1,5,1,1,1,2,1
