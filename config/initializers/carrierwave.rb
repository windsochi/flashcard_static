CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_directory  = 'fcwindsochieu'

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws_akey,
    aws_secret_access_key: Settings.aws_sakey,
    region: 'eu-west-1'
  }
end
