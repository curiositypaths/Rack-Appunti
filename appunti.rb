require 'rack'
require 'rack/server'

class AppuntiApp
  def self.call(env)
    [ 200, { }, ['Welcome to your notebook'] ]
  end
end

Rack::Server.start :app => AppuntiApp
