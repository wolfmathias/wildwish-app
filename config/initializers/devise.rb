Devise.setup do |config|
    # Add the credentials from app to your secrets
    client_id = Rails.application.secrets[:google_client_id]
    client_secret = Rails.application.secrets[:google_secret]
    # Configure Google omniauth with proper scope
    config.omniauth :google_oauth2, client_id, client_secret, {
      scope: "contacts.readonly,userinfo.email"
    }
  end