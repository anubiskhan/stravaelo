Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, ENV["strava_client_id"], ENV["strava_client_secret"]
end
