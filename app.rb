#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Addpost < ActiveRecord::Base
end

before do
end

get '/' do
	erb "Hello"
end

get '/addpost' do
	@add = Addpost.new
	erb :addpost
end