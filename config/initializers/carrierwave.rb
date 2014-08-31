require 'aws'
CarrierWave.configure do |config|

  config.fog_directory = FlashcardStaticAWS.config['directory']

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: FlashcardStaticAWS.config['access_key_id'],
    aws_secret_access_key: FlashcardStaticAWS.config['secret_access_key'],
    region: FlashcardStaticAWS.config['region']
  }
end
