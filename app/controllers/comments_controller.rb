class CommentsController < ApplicationController
     def create
     @link = Link.find(params[:link_id])
     @comment = @link.comments.build(comment_params)

     if @link.save
       redirect_to @link.comment
     else
       redirect_to root_url
     end
   end

   private
     def comment_params
       params.require(:comment).permit(:body)
     end
end
