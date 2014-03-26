class Temperature
  def initialize(temps = {})
    @temps = temps
  end

  def in_fahrenheit
    @temps.key?(:f) ? @temps[:f] : (@temps[:c]*9.0/5)+32
  end

  def in_celsius
    @temps.key?(:c) ? @temps[:c] : (@temps[:f]-32) * 5.0/9
  end

  def self.from_celsius(n)
    self.new(:c => n)
  end

  def self.from_fahrenheit(n)
    self.new(:f => n)
  end
end

class Celsius < Temperature
  def initialize(num, temps = {})
    @temps = temps
    @temps[:c] = num
  end

  def in_fahrenheit
    super
  end

  def in_celsius
    super
  end
end

class Fahrenheit < Temperature
  def initialize(num, temps = {})
    @temps = temps
    @temps[:f] = num
  end

  def in_fahrenheit
    super
  end

  def in_celsius
    super
  end
end
