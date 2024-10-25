# frozen_string_literal: true

require 'sinatra/base'

## App
class App < Sinatra::Base
  get '/' do
    'It works!'
  end

  get '/hello/:name' do
    "Hello #{params[:name]}"
  end
end

run App.new
