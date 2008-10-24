require File.dirname(__FILE__) + "/test_helper"

class MachineTagTest < Test::Unit::TestCase
  def test_machinetaggings
    assert_equal [machinetaggings(:bear_animal), machinetaggings(:frog_animal)], machinetags(:animal).machinetaggings
    assert_not_equal [machinetaggings(:cactus_plant), machinetaggings(:orange_plant)], machinetags(:animal).machinetaggings
  end
  
  def test_parse_does_not_change_param
    list = 'a b c'
    original = list.dup
    MachineTag.parse(list)
    assert_equal list, original
  end
  
  def test_parse_blank
    assert_equal [], MachineTag.parse(nil)
    assert_equal [], MachineTag.parse('')
  end
  
  def test_parse_single_machinetag
    assert_equal ['a'], MachineTag.parse('a')
    assert_equal ['a'], MachineTag.parse('"a"')
  end
  
  def test_parse_quoted_machinetags
    assert_equal ['a b', 'c'], MachineTag.parse('"a b" c')
  end
  
  def test_parse_comma_dilineation
    assert_equal ['a', 'b', 'c'], MachineTag.parse('a,b,c')
    assert_equal ['a', 'b', 'c'], MachineTag.parse('a,b,c')
  end
  
  def test_parse_quotes_and_commas
    assert_equal ['a,b', 'c'], MachineTag.parse('"a,b",c')
  end
  
  def test_parse_removes_whitespace
    assert_equal ['a', 'b', 'c'], MachineTag.parse('a  b,   c')
  end
  
  def test_parse_removes_duplicates
    assert_equal ['a', 'b', 'c'], MachineTag.parse('a b a c a b')
  end
  
  def test_machinetag
    assert !machinetags(:favorite).machinetagged.include?(things(:bear))
    machinetags(:favorite).machinetag(things(:bear))
    assert machinetags(:favorite).machinetagged.include?(things(:bear))
  end
  
  def test_machinetagged
    assert_equal [things(:bear), things(:frog)], machinetags(:animal).machinetagged
    assert_not_equal [things(:bear), things(:frog)], machinetags(:plant).machinetagged
  end
  
  def test_equality
    assert_equal machinetags(:animal), machinetags(:animal)
    assert_equal MachineTag.find(1), MachineTag.find(1)
    assert_equal MachineTag.new(:name => 'mineral'), MachineTag.new(:name => 'mineral')
    assert_not_equal MachineTag.new(:name => 'mineral'), machinetags(:animal)
  end
  
  def test_to_s
    assert_equal machinetags(:animal).name, machinetags(:animal).to_s
  end
end