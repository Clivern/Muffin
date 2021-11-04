# frozen_string_literal: true

#
# Muffin - Multi-Language Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :key
      t.text :value
      t.boolean :autoload

      t.timestamps
    end
  end
end
