# frozen_string_literal: true

#
# Muffin - Ruby on Rails in Action.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

Rails.application.routes.draw do
  get '_health', to: 'health#index'

  #
  # ------------
  # Options CRUD
  # ------------
  # curl -X POST http://127.0.0.1:3000/option -d '{"key": "app_name", "value": "muffin", "autoload": true}' -s | jq .
  # curl -X PUT http://127.0.0.1:3000/option/app_name -d '{"value": "Muffin", "autoload": false}' -s | jq .
  # curl -X GET http://127.0.0.1:3000/option/app_name -s | jq .
  # curl -X DELETE http://127.0.0.1:3000/option/app_name -s | jq .
  #
  get "/option", to: "option#index"
  get "/option/:key", to: "option#show"
  put "/option/:key", to: "option#update"
  post "/option", to: "option#create"
  delete "/option/:key", to: "option#destroy"
end
