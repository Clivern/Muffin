# frozen_string_literal: true

#
# Muffin - Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

class CreateSnippets < ActiveRecord::Migration[6.1]
  def change
    create_table :snippets do |t|
      t.string :slug
      t.string :language
      t.string :version
      t.string :title
      t.text :code
      t.boolean :is_public
      t.string :password

      t.timestamps
    end
  end
end
