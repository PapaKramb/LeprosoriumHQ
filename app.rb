#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base
	has_many :comment
end

class Comment < ActiveRecord::Base
	belongs_to :post
end

# before do
# 	@posts = Post.all
# end

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

get '/comment/:id' do
	@comments = Comment.new
	erb :comment
end

post '/comment/:id' do
	@comments = Comment.new params[:comment]
	if @comments.save
		erb "Мы опубликовали Ваш комментарий"
	else
		@error = @comments.errors.full_messages.first 
		erb :comment
	end
end