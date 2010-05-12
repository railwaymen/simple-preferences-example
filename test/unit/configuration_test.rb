require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase

  test "get setting value by key" do
    assert_equal "error@localhost.com", Configuration.get(:error_email_address)
    assert_equal "1", Configuration[:send_email]
  end

  test "get all setting values" do
    expected_hash = {"send_email"=>"1", "error_email_address"=>"error@localhost.com"} 
    assert_equal expected_hash, Configuration.get
  end

  test "set new setting" do
    assert_nil Configuration.find_by_setting("new_setting_key")
    assert_difference('Configuration.count', 1) do
      Configuration.set(:new_setting_key => "new_setting_value")
    end
    assert_not_nil new_conf = Configuration.find_by_setting("new_setting_key")
    assert_equal "new_setting_value", new_conf.value
  end

  test "set new setting by mass assigment" do
    assert_nil Configuration.find_by_setting("new_setting_key1")
    assert_nil Configuration.find_by_setting("new_setting_key2")
    assert_difference('Configuration.count', 2) do
      Configuration.set(:new_setting_key1 => "new_setting_value1", :new_setting_key2 => "new_setting_value2")
    end

    assert_not_nil new_conf1 = Configuration.find_by_setting("new_setting_key1")
    assert_equal "new_setting_value1", new_conf1.value
    
    assert_not_nil new_conf2 = Configuration.find_by_setting("new_setting_key2")
    assert_equal "new_setting_value2", new_conf2.value
  end

end
