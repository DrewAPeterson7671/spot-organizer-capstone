Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, Rails.application.credentials.spotify[Pusher.app_id], Rails.application.credentials.spotify[Pusher.secret], scope: %w(
    playlist-read-private
    user-read-private
    user-read-email
  ).join(' ')
end
