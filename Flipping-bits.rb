# https://www.hackerrank.com/challenges/flipping-bits/problem

#!/bin/ruby

def flippingBits(n)
    a = Array.new(32-n.to_s(2).length,0).join("")+n.to_s(2)
    b = a.split("").map!{|a| (a=="1"? 0 : 1)}.join("").to_i(2)
    b
end

t = gets.strip.to_i
for a0 in (0..t-1)
    n = gets.strip.to_i
    result = flippingBits(n)
    puts result
end
