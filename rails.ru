# frozen_string_literal: true

require 'action_controller/railtie'

## App
class App < Rails::Application
  config.secret_key_base = 'secret_key_base'
  config.logger = Logger.new($stdout)
  Rails.logger = config.logger

  routes.draw do
    root 'apps#index'
    resources :apps, only: :show, path: 'hello'
  end
end

## AppsController
class AppsController < ActionController::Base
  def index
    render plain: 'It works!'
  end

  def show
    render plain: "Hello #{params[:id]}!"
  end
end

run Rails.application
