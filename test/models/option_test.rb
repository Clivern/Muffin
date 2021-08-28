# frozen_string_literal: true

#
# Muffin - Ruby on Rails in Action.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

require "test_helper"

class OptionTest < ActiveSupport::TestCase
  test "it is a valid option with values" do
    option = Option.new(key: "key_01", value: "value_01", autoload: false)
    assert_equal 'key_01', option.key
    assert_equal 'value_01', option.value
    assert_equal false, option.autoload
  end

  test "it is a valid option with empty values" do
    option = Option.new(key: "key_02", value: "", autoload: true)
    assert_equal 'key_02', option.key
    assert_equal '', option.value
    assert_equal true, option.autoload
  end
end
