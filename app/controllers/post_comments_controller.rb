class PostCommentsController < ApplicationController
  
  def create #コメント投稿機能を作成する
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    #comment = PostComment.new(post_comment_params)
    #comment.user_id = current_user.idを一つに省略↑
    comment.post_image_id = post_image.id 
    comment.save
    redirect_to post_image_path(post_image) #投稿されたコメントを保存した後は、post_image_path(post_image)へリダイレクト
  end
  

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
