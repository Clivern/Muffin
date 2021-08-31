# frozen_string_literal: true

#
# Muffin - Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

class HealthController < ApiController
  def index
    render :json => {:status => "ok"}
  end
end
