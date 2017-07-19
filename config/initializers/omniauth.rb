OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '1486938461366578', '710013d02f8ea8c6e16611a5d08e61ab',
  provider :facebook, Settings.facebook_app_id, Settings.facebook_secret,
  scope: 'user_posts, publish_actions, manage_pages, publish_pages, user_photos',
  display: 'popup'
end

