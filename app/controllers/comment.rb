# ================= CREATE NEW COMMENT =====================

post '/comment/:id' do
	@comment = Comment.create(user_id: session[:user_id], article_id: params[:id], comment: params[:comment_text])
	erb :_comment, layout: false
end


