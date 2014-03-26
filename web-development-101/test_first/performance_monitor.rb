def measure(n=1)
  if n==1
    y=Time.now
    yield
    Time.now-y
  else
    timings = []
    n.times {
    y=Time.now
    yield
    timings.push(Time.now-y)
    }
    timings.reduce(:+)/n.to_f
  end
end