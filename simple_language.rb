# https://www.hackerrank.com/contests/w37/challenges/simple-language

def maximumProgramValue(n)
    x = 0
	while n > 0
		input = gets.chomp.split(" ")
		if input.first == "add"
			x += input.last.to_i if (x + input.last.to_i) >= x
		else
			x = input.last.to_i if input.last.to_i >= x
		end
		n -=1
	end
    x
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

result = maximumProgramValue n

fptr.write result
fptr.write "\n"

fptr.close()
