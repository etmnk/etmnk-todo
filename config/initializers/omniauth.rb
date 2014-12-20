Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
