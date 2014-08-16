# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
FlashcardStatic::Application.config.secret_key_base = 'dcc5ecb33ef5b5bd6db36ff2c0e09a2ea7a589c27690b00942d089a62c3bfbd0b8e487cf75e558f0250dabcb75cba705477fb8e389d9cf8fd853be1867b4678c'
Sorcery::Application.config.secret_key_base = 'f3257e7a9de8e03cde561febf767d998a0c0c942e8adfed95b6d4cd8efba34fa25759b0231555f0f626fc8bc5fee37db8cf29c9ca75f929155cd9665c33af822'
