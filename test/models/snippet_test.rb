# frozen_string_literal: true

#
# Muffin - Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

require "test_helper"

class SnippetTest < ActiveSupport::TestCase
  test "it is a valid snippet with values" do
    snippet = Snippet.create(
      slug: '4f76f879128862abdac5b200e9ac7d8f',
      language: 'ruby',
      title: 'Hello World',
      code: '....',
      is_public: false,
      password: '....',
      created_at: DateTime.now,
      updated_at: DateTime.now
    )

    assert snippet.valid?
    assert_equal '4f76f879128862abdac5b200e9ac7d8f', snippet.slug
    assert_equal 'ruby', snippet.language
    assert_equal '....', snippet.code
    assert_equal 'Hello World', snippet.title
    assert_equal '....', snippet.password
    assert_not_empty snippet.created_at.to_s
    assert_not_empty snippet.updated_at.to_s
  end
end
