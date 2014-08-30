CarrierWave.configure do |config|

  config.fog_directory  = 'fcwindsochieu'

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAINN543DYUSEROQGQ',
    aws_secret_access_key: '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',
    region: 'eu-west-1'
  }
end
