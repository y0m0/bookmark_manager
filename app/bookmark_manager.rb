ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end
  
  post '/links' do
    p 'hello'
    link = Link.new(url: params[:url],              # 1. Create a new instance of link
             title: params[:title])
    Tag.create(name: 'test')
    tag = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
    link.tags << tag                                # 3. Add the tag to the link's datamapper collection
    link.save                                       # 4. Save the link
    redirect '/links'
  end
  
  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
