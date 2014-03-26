class Timer

  def initialize
    @seconds = 0
  end

  def time_string
    hours = self.seconds / (60*60)
    remain_sec = self.seconds % (60*60)
    minutes = remain_sec / 60
    remain_sec = remain_sec % 60
    return "%s:%s:%s" % [padded(hours), padded(minutes), padded(remain_sec)]
  end

  def padded(n)
    if n >= 10
      return n.to_s
    else
      return "0"+n.to_s
    end
  end
end
