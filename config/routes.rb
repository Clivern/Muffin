# frozen_string_literal: true

#
# Muffin - Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

Rails.application.routes.draw do
  get '_health', to: 'health#index'

  # Option Routes
  get "/api/v1/option", to: "option#index"
  get "/api/v1/option/:key", to: "option#show"
  put "/api/v1/option/:key", to: "option#update"
  post "/api/v1/option", to: "option#create"
  delete "/api/v1/option/:key", to: "option#destroy"

  # Snippet Routes
  get "/api/v1/snippet/:slug", to: "snippet#show"
  post "/api/v1/snippet", to: "snippet#create"
end
