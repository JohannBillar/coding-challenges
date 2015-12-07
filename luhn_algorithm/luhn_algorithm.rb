module Luhn

  def self.is_valid?(number)
    card_numb_reverse = number.to_s.split('').reverse
    luhn_sum = 0
    card_numb_reverse.each.with_index do |number, index|
      if index.odd?
        value = number.to_i * 2
        value >= 10 ? (luhn_sum += (value - 9)) : luhn_sum += value
      else
        luhn_sum += number.to_i
      end
    end
    luhn_sum % 10 == 0 ? true : false
  end

end  

class Checker 
  attr_accessor :number
  
  def initialize(number)
    @number = number
  end
 
  def card_numb_reverse
    @number.to_s.split('').reverse
  end

  def card_numb_value
    luhn_sum = 0
    card_numb_reverse.each.with_index do |number, index|
      if index.odd?
        value = number.to_i * 2
        value >= 10 ? (luhn_sum += (value - 9)) : luhn_sum += value
      else
        luhn_sum += number.to_i
      end
    end
    luhn_sum
  end

  def valid_check
    card_numb_value % 10 == 0
  end

end
