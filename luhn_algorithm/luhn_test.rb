require './luhn_algorithm'
require 'minitest/autorun'

class TestLuhn < MiniTest::Test

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

class TestChecker < Minitest::Test

  def test_card_numb_reverse
    test_card = Checker.new(4194560385008504)
    assert_equal(
    ["4", "0", "5", "8", "0", "0", "5", "8", "3", "0", "6", "5", "4", "9", "1", "4"],
    test_card.card_numb_reverse
    )
  end

  def test_card_numb_value
    test_card = Checker.new(4194560385008504)
    assert_equal(
    60,
    test_card.card_numb_value
    )
  end

  def test_card_numb_value2
    test_card = Checker.new(4194560385008505)
    assert_equal(
    61,
    test_card.card_numb_value
    )
  end

  def test_card_numb_value3
    test_card = Checker.new(377681478627336)
    assert_equal(
    70,
    test_card.card_numb_value
    )
  end

  def test_card_numb_value4
    test_card = Checker.new(377681478627337)
    assert_equal(
    71,
    test_card.card_numb_value
    )
  end 

end  