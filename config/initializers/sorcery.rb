Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|
  config.external_providers = [:twitter, :facebook]

  config.twitter.key = Settings.sorcery-ext.twitter-key
  config.twitter.secret = Settings.sorcery-ext.twitter-secret
  config.twitter.callback_url = Settings.sorcery-ext.twitter-callback
  config.twitter.user_info_mapping = {:username => "screen_name"}

  config.facebook.key = Settings.sorcery-ext.facebook-key
  config.facebook.secret = Settings.sorcery-ext.facebook-secret
  config.facebook.callback_url = Settings.sorcery-ext.facebook-callback
  config.facebook.user_info_mapping = {:email => "email", :name => "name", :username => "username", :hometown => "hometown/name"}
  config.facebook.scope = "email,offline_access,user_hometown,user_interests,user_likes"
  config.facebook.display = "popup"

  config.user_config do |user|
    user.authentications_class = Authentication
    user.username_attribute_names = [:email]
  end
  config.user_class = "User"
end
