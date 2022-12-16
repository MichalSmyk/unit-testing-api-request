require_relative '../lib/time_error'
require 'net/http'

RSpec.describe TimeError do 
    it 'returns the time diffrence between computer and server' do 
        fake_requester = double :requester
        allow(fake_requester).to receive(:get).with(
            URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"86.175.226.164","datetime":"2022-12-16T10:38:25.538439+00:00","day_of_week":5,"day_of_year":350,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1671187105,"utc_datetime":"2022-12-16T10:38:25.538439+00:00","utc_offset":"+00:00","week_number":50}')
        time = Time.new(2022, 12, 16, 10, 38, 25)
        time_error = TimeError.new(fake_requester)
        expect(time_error.error(time)).to eq 0.538439
    end
end