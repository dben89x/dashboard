class MeetupsController < ApplicationController
	def index
		require 'net/http'
		uri = URI("https://api.meetup.com/self/events")
		key = ENV['meetup_key']

		# Upcoming
		params = {sign: true, key: key, page: 20, rsvp: "yes", status: "upcoming"}

		# Past
		# params = {sign: true, key: key, page: 20, rsvp: "yes", status: "past"}

		uri.query = URI.encode_www_form(params)
		@response = Net::HTTP.get_response(uri)
		@events = JSON.parse(@response.body) if @response.is_a?(Net::HTTPSuccess)
		@events_json = create_events_json(@events)
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

end
