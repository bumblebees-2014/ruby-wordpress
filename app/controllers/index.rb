get '/' do
	@articles = Article.all.reverse[0..11]
	@articles
	erb :index
end