require 'benchmark'

def iterative_fib(n)
  arr = [0,1]
  (n-1).times do
    x = arr[-1] + arr[-2]
    arr << x
  end
  arr
end

puts iterative_fib(35).inspect


def new_sequence(current_sequence, count=0)
  count += 1
  if count == 9
    return current_sequence
  end
  x = current_sequence[-1] + current_sequence[-2]
  result = current_sequence + [x]
  new_sequence(result, count)
end

puts new_sequence([0,1]).inspect


def recursive_fib(n)
  if n < 2
    return n
  else
    return (recursive_fib(n-1) + recursive_fib(n-2))
  end
end

puts recursive_fib(35)


num = 35
Benchmark.bm do |x|
  x.report("iterative_fib") { iterative_fib(num) }
  x.report("recursive_fib") { recursive_fib(num) }
end
