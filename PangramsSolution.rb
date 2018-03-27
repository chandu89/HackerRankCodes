class Pangram
  def self.pangrams(s)
    flag = s.downcase.gsub(/[!@%&",]/,'').split("").reject{|c| c.strip.empty?}.uniq.sort == ('a'..'z').to_a
    return (flag ? "pangram" : "not pangram")
  end
end
Pangram.pangrams("We promptly judged antique ivory buckles for the next prize")
