#Exercise 1 LIFO
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

#Exercise 2 FIFO
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

#Exercise 3
class Map
  def initialize
    @my_map = []
  end

  def assign(key, value)
    if lookup(key).nil?
      @my_map << [key, value]
    else
      @my_map.each do |pair|
        pair[1] = value if pair[0] == key
      end
    end
  end

  def lookup(key)
    @my_map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    value = lookup(key)

    return value if value.nil?

    @my_map - [[key, value]]
    [key, value]
  end

  def show
    @my_map.dup
  end
end
