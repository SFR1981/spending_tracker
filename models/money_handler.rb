class MoneyHandler




def self.check_decimal(string)
  # value = "99.99"
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
