require 'bundler'
Bundler.require

get '/hello/:name' do
  @name = params[:name]
  erb :index, locals: {my_var: 10}
end

get '/without/layout/hello/:name' do
  @name = params[:name]
  erb :index, locals: {my_var: 10}, layout: false
end
