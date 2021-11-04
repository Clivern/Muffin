# frozen_string_literal: true

#
# Muffin - Multi-Language Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

Rails.application.routes.draw do
  # Home Route
  get '/', to: 'home#show'

  # Health Route
  get '_health', to: 'health#index'

  # Option Route
  get "/api/v1/option", to: "option#index"
  get "/api/v1/option/:key", to: "option#show"
  put "/api/v1/option/:key", to: "option#update"
  post "/api/v1/option", to: "option#create"
  delete "/api/v1/option/:key", to: "option#destroy"

  # Snippet Route
  get "/api/v1/snippet/:slug", to: "snippet#show"
  get "/api/v1/snippet/:slug/output", to: "snippet#output"
  post "/api/v1/snippet", to: "snippet#create"
  put "/api/v1/snippet/:slug", to: "snippet#update"
  delete "/api/v1/snippet/:slug", to: "snippet#destroy"
end
