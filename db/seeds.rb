# frozen_string_literal: true

#
# Muffin - Multi-Language Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed database with options
Option.create([
  {
    key: 'key_01',
    value: 'value_01',
    autoload: true,
    created_at: DateTime.now,
    updated_at: DateTime.now
  },
  {
    key: 'key_02',
    value: 'value_02',
    autoload: false,
    created_at: DateTime.now,
    updated_at: DateTime.now
  },
  {
    key: 'key_03',
    value: 'value_03',
    autoload: true,
    created_at: DateTime.now,
    updated_at: DateTime.now
  },
  {
    key: 'key_04',
    value: 'value_04',
    autoload: false,
    created_at: DateTime.now,
    updated_at: DateTime.now
  },
  {
    key: 'key_05',
    value: 'value_05',
    autoload: true,
    created_at: DateTime.now,
    updated_at: DateTime.now
  }
])
