CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_directory  = Settings.aws.direct

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws.akey,
    aws_secret_access_key: Settings.aws.sakey,
    region: 'eu-west-1'
  }
end
