CarrierWave.configure do |config|

  config.fog_directory = Settings.s3_direct

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.s3_key,
    aws_secret_access_key: Settings.s3_secret,
    region: Settings.s3_region
  }
end
