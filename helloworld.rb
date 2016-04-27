require 'rack'
require 'rack/server'

class HelloWorld
  def response
    [200, {}, ['Hello World']]
  end
end

class HelloWorldApp
  def self.call(env)
    [200, {}, ["Hello World You said: #{env['QUERY_STRING']}"]]
  end
end

Rack::Server.start :app => HelloWorldApp
