require File.dirname(__FILE__) + "/test_helper"

class MachineTaggingTest < Test::Unit::TestCase
  def test_machinetaggable
    assert_equal things(:bear), machinetaggings(:bear_animal).machinetaggable
    assert_not_equal things(:frog), machinetaggings(:bear_animal).machinetaggable    
  end
  
  def test_machinetag
    assert_equal machinetags(:animal), machinetaggings(:bear_animal).machinetag
    assert_not_equal machinetags(:plant), machinetaggings(:bear_animal).machinetag
  end
end