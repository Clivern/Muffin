# frozen_string_literal: true

#
# Muffin - Ruby on Rails in Action.
#
# Copyright 2021 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.
#

class OptionController < ApiController
	# List Options
	def index
		@options = Option.all
		render json: @options
	end

	# Gets an Option with a key
	def show
		@option = Option.find_by_key(params[:key])

		if @option
			render json: @option, status: 200
		else
			render json: {'errorMessage': 'Option not found.'}, status: 404
		end
	end

	# Creates an Option
	def create
		req = ActiveSupport::JSON.decode(request.body.read)

		@option = Option.find_by_key(req["key"])

		if @option
			render json: {'errorMessage': 'Option already exists.'}, status: 400
		else
	    @option = Option.create(
	      key: req["key"] == nil ? "" : req["key"],
	      value: req["value"] == nil ? "" : req["value"],
	      autoload: req["autoload"] == nil ? false : req["autoload"],
	      created_at: DateTime.now,
	      updated_at: DateTime.now
	    )

			if @option
				render json: @option, status: 201
			else
				render json: {'errorMessage': 'Unable to create an option'}, status: 500
			end
		end
	end

	# Updates an Option
	def update
		req = ActiveSupport::JSON.decode(request.body.read)

		@option = Option.find_by_key(params[:key])

		if @option
			@option.value = req["value"] == nil ? "" : req["value"]
			@option.autoload = req["autoload"] == nil ? false : req["autoload"]
			@option.updated_at = DateTime.now
			@option.save

			render json: @option, status: 200
		else
			render json: {'errorMessage': 'Option not found.'}, status: 404
		end
	end

	# Deletes an Option
	def destroy
		@option = Option.find_by_key(params[:key])

		if @option
			@option.destroy
			render json: {}, status: 204
		else
			render json: {'errorMessage': 'Option not found.'}, status: 404
		end
	end
end
