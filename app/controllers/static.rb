

get '/' do
  @urls = Url.all	
  erb :"static/index"
end

post '/urls' do 
  url = Url.new
  url.long_url = params[:long_url]
  url.short_url = url.shorten
  url.save
end

get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url]).long_url

  redirect url
end

