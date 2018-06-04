class TournamentsController < ApplicationController
  def show
    @tournament_presenter = TournamentPresenter.new(params)
  end

  def new
    @tournament = Tournament.new
    @segments = Segment.order(:name)
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      @tournament.user_tournaments.create(user_id: current_user.id)
      create_tournament_segments(params)
      flash[:success] = "Created a new tournament"
      redirect_to tournament_path(@tournament)
    else
      flash[:error] = "Failed to create new tournament"
      render :new
    end
  end

  private
    def tournament_params
      params.require(:tournament).permit(:name)
    end

    def create_tournament_segments(params)
      params[:segments].each do |id|
        @tournament.tournament_segments.create(segment_id: id.to_i)
      end
    end
end
