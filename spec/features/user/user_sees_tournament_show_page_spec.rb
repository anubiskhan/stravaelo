require 'rails_helper'

describe 'User' do
  context 'visits dashboard' do
    scenario 'sees all tournaments they are a part of' do
      VCR.use_cassette("tournament-show") do
        user1 = create(:user, token: ENV['strava_my_token'])
        tournament1 = create(:tournament)
        segment1 = create(:segment, id: 1470688)
        segment2 = create(:segment, id: 5816161)
        create(:user_tournament, user: user1, tournament: tournament1)
        create(:tournament_segment, tournament: tournament1, segment: segment1)
        create(:tournament_segment, tournament: tournament1, segment: segment2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit tournament_path(tournament1)

        expect(page).to have_content("02:16:58")
        expect(page).to have_content("00:18:55")
     end
    end
  end
end
