
def solve(n)
    count = 0
    while n !=0
        count+= ( n%2!= 0 ? 0 : 1)
        n=n/2
    end
    2**count
end

n = gets.strip.to_i
result = solve(n)
puts result;
