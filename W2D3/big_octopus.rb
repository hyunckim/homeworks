#O(n^2)
def quadratic_search(fishes)

  fishes.each_with_index do |fish1, idx|
    max_length = true
    fishes.each_with_index do |fish2, idx2|
      next if idx == idx2
      max_length = false if fish2.length > fish1.length
    end
    return fish1 if max_length
  end
end

#O(nlog(n))
#merge_sort
def n_log_n_search(fishes)

  return fishes if fishes.length <= 1

  midpoint = fishes.length/2

  left = n_log_n_search(fishes[0...midpoint])
  right = n_log_n_search(fishes[midpoint..-1])

  merge(left, right)[0]
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when 0
      merged << left.shift
    when -1
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged.concat(right)
  merged.concat(left)

  merged
end

#O(n)
def linear_search(fishes)
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish
end

#O(n)
def slow_dance(direction, array)
  array.each_with_index do |el, idx|
    return idx if el == direction
  end
end

#O(1)

hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
def fast_dance(direction, hash)
  hash[direction]
end
