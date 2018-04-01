def xorSequence(l, r)
   res = xor_pat(r)^xor_pat(l-1)
end

def xor_pat(x)
    a = x % 8;
    return x if(a == 0 || a == 1)
    return 2 if(a == 2 || a == 3)
    return x+2 if(a == 4 || a == 5)
    return 0 if(a == 6 || a == 7) 
    return 0
end
fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    lr = gets.rstrip.split

    l = lr[0].to_i

    r = lr[1].to_i

    result = xorSequence l, r

    fptr.write result
    fptr.write "\n"
end

fptr.close()
