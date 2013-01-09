$:.unshift File.expand_path("../lib", __FILE__)

$stdout.sync = true

require 'sinatra'
require 'funpack'
require 'settings_helper'
require 'haml'
require 'json'

require 'sinatra/reloader' if development?

helpers SettingsHelper

configure do
  set(:css_dir) { File.join(views, 'css') }
end

get '/' do
  @funpack = Funpack.load
  haml :edit
end

post '/' do
  @funpack = Funpack.load
  @settings = @funpack.settings(params)
  puts "settings: #{JSON.dump(@settings)}"
  haml :show
end

get '/up' do
  @funpack = Funpack.load
  if @funpack.settings.nil?
    redirect '/stopped'
  else
    haml :up
  end
end
