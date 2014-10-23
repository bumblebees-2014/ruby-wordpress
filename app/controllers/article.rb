
# ================= CREATE NEW ARTICLE =====================

get '/article/new' do
  erb :'new_article'
end

post '/create' do
	Article.create(title: params[:title], content: params[:content], image_url: params[:image_url], user_id: session[:user_id])
  redirect '/'
end



# ================= DELETE ARTICLE =====================

delete '/article/:id' do |id|
	@article = Article.find_by(id: id)
	@article.destroy
	redirect "/"
end



# ================= UPDATE =====================

get '/article/:id/edit' do
  @article = Article.find(params[:id])
  erb :edit_article
end

patch '/article/:id' do
	article = Article.find(params[:id])
	article.update!(title: params[:title], content: params[:content], image_url: params[:image_url], user_id: session[:user_id])
	redirect '/'
end






# ================= READ	 =====================

get '/article/:id' do
  @article = Article.find(params[:id])
  puts "--------------------------------begin"
  puts @article.tags
  puts "--------------------------------end"
  erb :show_article
end












