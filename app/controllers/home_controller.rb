class HomeController < ApplicationController
	def index
		require 'net/http'
		uri = URI("https://api.meetup.com/self/events")
		key = "46523297e73e19d56293034516434"
		params = {sign: true, key: key, page: 20, rsvp: "yes", status: "upcoming"}
		uri.query = URI.encode_www_form(params)
		res = Net::HTTP.get_response(uri)
		@response = res.body if res.is_a?(Net::HTTPSuccess)
		@events = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
		@events_json = create_events_json(@events)
	end

	private

	def create_events_json(events)

		events.collect do |event|
			start_time = Time.at(parse_time(event['time']))
			end_time = start_time + parse_time(event['duration'])
			{
				start_time: start_time,
				end_time: end_time,
				name: event['name'],
				group: event['group']['name'],
				link: event['link'],
				rsvp_count: event['yes_rsvp_count'],
				description: event['description'].force_encoding('UTF-8'),
			}
		end
	end

	def parse_time(time)
		time.to_i/1000
	end
end
