# frozen_string_literal: true

require 'rack/request'
require 'rack/response'

## App
class App
  def call(env)
    request = Rack::Request.new(env)
    method = request.request_method
    path = request.path_info

    case [method, path]
    in ['GET', '/']
      Rack::Response.new('It works!', 200).finish
    in ['GET', %r{^/hello/(\w+)$}]
      params = path.split('/')
      body = "#{[params[1].capitalize, params[2..]].join(' ')}!"
      Rack::Response.new(body, 200).finish
    else
      Rack::Response.new('Not found', 404).finish
    end
  end
end

run App.new
