# frozen_string_literal: true

#
# Muffin - Coding Playground Platform.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

require 'securerandom'

class SnippetController < ApiController
  # Gets a Snippet
  def show
    @snippet = Snippet.find_by_slug(params[:slug])

    if @snippet
      render json: @snippet, status: 200
    else
      render json: {'errorMessage': 'Snippet not found.'}, status: 404
    end
  end

  # Creates a New Snippet
  def create
    req = ActiveSupport::JSON.decode(request.body.read)

    # Create a unique snippet slug
		loop do
		  @slug = SecureRandom.hex
		  if !Snippet.find_by_slug(@slug)
		    break
		  end
		end

  	@snippet = Snippet.create(
    	slug: @slug,
    	language: req["language"] == nil ? '' : req["language"],
    	title: req["title"] == nil ? '' : req["title"],
    	code: req["code"] == nil ? '' : req["code"],
    	password: req["password"] == nil ? '' : req["password"],
    	is_public: req["is_public"] == nil ? true : req["is_public"],
    	created_at: DateTime.now,
    	updated_at: DateTime.now
  	)

		if @snippet
	  	render json: @snippet, status: 201
		else
	  	render json: {'errorMessage': 'Unable to create a new snippet'}, status: 500
		end
  end
end
