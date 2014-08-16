require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module FlashcardStatic
  class Application < Rails::Application
  end
end

module Sorcery
  class Application < Rails::Application
  end
end
