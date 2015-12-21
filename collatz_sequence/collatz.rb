def collatz(n , arr=[])
  arr << n
  if n == 1
    return arr
  elsif n.odd?
    collatz((3 * n) + 1, arr)
  else
    collatz(n / 2, arr)
  end
end

largest_length = 0
largest_num = nil

(1..1000_000).each do |num|
  current_length = collatz(num).length
  if current_length > largest_length
    largest_length = current_length
    largest_num = num    
  end 
end

puts "Number #{largest_num} gives the largest collatz sequence of #{largest_length}"
