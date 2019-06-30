require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:firstblog.db"

class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :post
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

before '/details/:post_id' do

	@post = Post.find params[:post_id]

end

get '/details/:post_id' do

	@comments = @post.comments.all

	erb :details

end

post '/details/:post_id' do

	comment = @post.comments.new params[:comment]
	comment.save

	redirect to "/details/#{params[:post_id]}" 

end
