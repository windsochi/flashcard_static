require 'loadconfig'
Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|
  config.user_class = "User"
  config.external_providers = [:github, :twitter, :facebook]
  config.github.key =            LoadConfigYml.config['github_key']
  config.github.secret =         LoadConfigYml.config['github_secret']
  config.github.callback_url =   LoadConfigYml.config['github_callback']
  config.github.user_info_mapping = {email: "name"}

  config.twitter.key =           LoadConfigYml.config['twitter_key']
  config.twitter.secret =        LoadConfigYml.config['twitter_secret']
  config.twitter.callback_url =  LoadConfigYml.config['twitter_callback']
  config.twitter.user_info_mapping = {email: "username"}

  config.facebook.key =          LoadConfigYml.config['facebook_key']
  config.facebook.secret =       LoadConfigYml.config['facebook_secret']
  config.facebook.callback_url = LoadConfigYml.config['facebook_callback']
  config.facebook.user_info_mapping = {email: "email"}
  config.facebook.scope = "email"

  config.user_config do |user|
    user.authentications_class = Authentication
    user.username_attribute_names = [:email]
  end
end
