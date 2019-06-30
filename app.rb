require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:firstblog.db"

class Post < ActiveRecord::Base
end

get '/' do

	@posts = Post.order 'created_at DESC'

	erb :index		
end

get '/new' do
	erb :new
end

post '/new' do

	p = Post.new params[:post]
	p.save

	redirect to '/'
end
