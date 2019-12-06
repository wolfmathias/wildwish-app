Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end

# OmniAuth::Strategies::GoogleOauth2 (alternative provider name recc'd by some sources)