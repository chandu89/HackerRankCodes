class CounterGames
   def self.counterGame(n)
    # Complete this function
    name = "Louise"
    while(n!=1)
        temp = n.to_s(2)
        if temp.count("1") == 1
            n=n/2
            name = (name=="Louise" ? "Richard" : "Louise" ) unless n==1
        else
            n = n-(2**(temp.length - (temp.index("1")+1)))
            name = (name=="Louise" ? "Richard" : "Louise") unless n==1
        end
    end
    name
  end
end

CounterGames.counterGame(6)

