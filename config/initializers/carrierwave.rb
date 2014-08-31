CarrierWave.configure do |config|

  config.fog_directory = Settings.S3_DIRECT

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.S3_KEY,
    aws_secret_access_key: Settings.S3_SECRET,
    region: Settings.S3_REGION
  }
end
