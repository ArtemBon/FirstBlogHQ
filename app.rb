require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:firstblog.db"

class Post < ActiveRecord::Base
end

get '/' do
	erb "First Blog"			
end