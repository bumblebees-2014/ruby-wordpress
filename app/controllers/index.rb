get '/' do
	@articles = Article.all.reverse[0..11]
	@articles
	erb :index
end

post '/' do
	puts "--------------------------------------------------------->"
	@json_articles = Article.all.limit(4).offset(params[:count]).to_json

 #  @json_articles.to_a.map!(&:serializable_hash)
	# @json_articles.each do |message|
	# 	message["name"] = User.find_by(id: message["sender_id"]).name
	# end
	# p @json_articles.to_json
	@json_articles
end