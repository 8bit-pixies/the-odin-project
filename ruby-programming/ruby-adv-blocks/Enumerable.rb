module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self[0]
  end
  
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self[0]
  end
  
  def my_select
    arr = []
    self.my_each do |el|
      arr << el if yield(el)
    end
    arr
  end
  
  def my_all?
    self.my_each do |el|
      if not yield(el)
        return false
      end
    end
    true
  end
  
  def my_any?
    self.my_each do |el|
      if yield(el)
        return true
      end
    end
    false
  end
  
  def my_none?
    self.my_each do |el|
      if yield(el)
        return false
      end
    end
    true
  end
  
  def my_count
    count = 0    
    self.my_each do |el|
      if yield(el)
        count += 1
      end
    end
  end
  
  def my_map
    out = []
    if block_given?
      self.my_each { |w| out << yield(w) }
    end
    out
  end
  
end

# example:
# [1,2,3].my_each do |w|
# puts w
# end