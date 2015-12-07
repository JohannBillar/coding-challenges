require 'minitest/autorun'

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
    luhn_sum % 10 == 0
  end

end

class TestLuhn < Minitest::Test

  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(4194560385008505)
  end

  def test_luhn_valid2
    assert Luhn.is_valid?(377681478627336), "Check step two: Did you start at the right?"
  end

  def test_luhn_invalid2
    assert ! Luhn.is_valid?(377681478627337), "Check step two: Did you start at the right?"
  end

end
