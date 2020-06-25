#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

before do
	@posts = Post.all
end

get '/' do
	@posts = Post.order('created_at DESC')
	erb :index
end

get '/new' do
	@posts = Post.new
	erb :new
end

post '/new' do
	@posts = Post.new params[:new]
	if @posts.save
		erb "Мы опубликовали Ваш пост на главной странице!"
	else
		@error = @add.errors.full_messages.first 
		erb :new
	end
end