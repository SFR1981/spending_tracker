class MoneyHandler




def self.check_decimal(string)
  if string.include?(".")
    string = string.to_f
    string = string * 100
    return string.to_s
  else
    string = string.to_i * 100
   return string.to_s
  end
end



end
