# frozen_string_literal: true

#
# Muffin - Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
