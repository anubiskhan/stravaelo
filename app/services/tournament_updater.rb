class TournamentUpdater
  attr_reader :tournament

  def initialize(tournament)
    @tournament = tournament
  end

  def update
    tournament.users.each do |user|
      tournament.segments.each do |segment|
        UserSegment.where(segment_id: segment.id, user_id: user.id)
                   .first_or_create
                   .update(pr: UserRankingQuery.new(user, segment).run)
      end
    end
  end
end