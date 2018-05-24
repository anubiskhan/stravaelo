require 'rails_helper'

describe "Segment Query" do
  context "searches for a segment from Strava api" do
    it 'returns required data in hash format' do
      VCR.use_cassette('segment-query') do
        query = SegmentQuery.new(229781)

        expect(query.raw_data).to be_a Hash
        expect(query.raw_data[:name]).to eq("Hawk Hill")
        expect(query.raw_data[:name]).to be_a Hash
        expect(query.raw_data[:distance]).to eq(2684.82)
        expect(query.raw_data[:distance]).to be_a Float
        expect(query.raw_data[:average_grade]).to eq(5.7)
        expect(query.raw_data[:average_grade]).to be_a Float
        expect(query.raw_data[:maximum_grade]).to eq(14.2)
        expect(query.raw_data[:maximum_grade]).to be_a Float
        expect(query.raw_data[:elevation_high]).to eq(245.3)
        expect(query.raw_data[:elevation_high]).to be_a Float
        expect(query.raw_data[:elevation_low]).to eq(92.4)
        expect(query.raw_data[:elevation_low]).to be_a Float
        expect(query.raw_data[:total_elevation_gain]).to eq(155.733)
        expect(query.raw_data[:total_elevation_gain]).to be_a Float
        expect(query.raw_data[:athlete_attempts]).to be_an Integer
        expect(query.raw_data[:unique_athletes]).to be_an Integer
      end
    end
  end
end
