class MeetupsController < ApplicationController
	def index
		require 'net/http'
		# https://api.meetup.com/find/events
		uri = URI("https://api.meetup.com/self/events")
		key = ENV['meetup_key']

		# Upcoming
		# params = {sign: true, key: key, page: 100, rsvp: "yes", status: "upcoming"}
		# params = {key: key, page: 100, lat: 34.0194543, lon: -118.4911912, topic_category: "tech", radius: 10}

		# Past
		params = {sign: true, key: key, page: 100, rsvp: "yes", status: "past"}

		uri.query = URI.encode_www_form(params)
		@response = Net::HTTP.get_response(uri)
		puts "Response: #{@response.inspect}"
		puts "Response body: #{@response.body.inspect}"
		@events = JSON.parse(@response.body) if @response.is_a?(Net::HTTPSuccess)
		puts "Events: #{@events}"
		@events_json = create_events_json(@events)
		# @meetup_json = meetup_json
	end

	private

	def create_events_json(events)

		events.collect do |event|
			start_time = Time.at(parse_time(event['time']))
			end_time = start_time + parse_time(event['duration'])
			description = event['description']
			encoded_description = description.present? ? description.force_encoding('UTF-8') : 'No description'
			{
				start_time: start_time,
				end_time: end_time,
				name: event['name'],
				group: event['group']['name'],
				link: event['link'],
				rsvp_count: event['yes_rsvp_count'],
				description: encoded_description,
			}
		end
	end

	def parse_time(time)
		time.to_i/1000
	end

	def meetup_json
	end

end
