require 'sinatra'
require 'pry'
require 'csv'
require_relative 'lib/wizard.rb'


# Root Directory
get '/' do

  @wizards = []

  CSV.open('public/articles.csv', headers: true).each do |row|
    wizard_title = row["Title"]
    wizard_desc = row["Description"]
    wizard_url = row["URL"]
    @wizards << Wizard.new(wizard_title,wizard_desc, wizard_url)
  end

  erb :index
end

# Form to Add new Articles
post '/articles' do
  CSV.open('public/articles.csv', 'ab') do |row|
    row.add_row(params.values)
  end

  redirect '/'
end


set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
