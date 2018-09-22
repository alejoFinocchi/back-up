require 'bundler'
Bundler.require

require_relative 'mol'

get '/' do
  'hello world'
end