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
    data = ActiveSupport::JSON.decode(request.body.read)

    # Create a unique snippet slug
    loop do
      @slug = SecureRandom.hex
      if !Snippet.find_by_slug(@slug)
        break
      end
    end

    @snippet = Snippet.create(
      slug: @slug,
      language: data["language"] == nil ? '' : data["language"],
      version: data["version"] == nil ? '' : data["version"],
      title: data["title"] == nil ? '' : data["title"],
      code: data["code"] == nil ? '' : data["code"],
      password: data["password"] == nil ? '' : data["password"],
      is_public: data["is_public"] == nil ? true : data["is_public"],
      created_at: DateTime.now,
      updated_at: DateTime.now
    )

    if @snippet
      render json: @snippet, status: 201
    else
      render json: {'errorMessage': 'Unable to create a new snippet'}, status: 500
    end
  end

  # Runs a snippet and return output
  # https://gist.github.com/Clivern/a7b03a4d90da991c49aa976b79e345ca
  def output
    @snippet = Snippet.find_by_slug(params[:slug])

    if @snippet
      runner = SnippetHelper::get_runner(
        @snippet.language.to_sym,
        Rails.root.join("storage"),
        @snippet.version,
        @snippet.slug,
        @snippet.code
      )

      begin
        runner.isolate_environment
        runner.build_image
        output = runner.run_script

        render json: {'output': output}, status: 200
      rescue => e
        render json: {'errorMessage': 'Failure while running the code.'}, status: 400
      end
    else
      render json: {'errorMessage': 'Snippet not found.'}, status: 404
    end
  end
end
