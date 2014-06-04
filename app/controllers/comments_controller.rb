class CommentsController < ApplicationController
	def index
		@comments = Comment.all
		@back_url = session[:entry_page]
	end

 	def new
	    @comment = Comment.new

    	respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @comment }
    	end
  	end

	def create
		@entry = Entry.find(params[:entry_id])
		@comment = @entry.comments.new(params[:comment])
		if @comment.save
			flash[:notice] = "Successfully created comment."
			redirect_to @entry
		else
			render :action => 'new'
		end
	end

	after_filter "save_entry_page", only: [:new]

	def save_entry_page
		session[:entry_page] = URI(request.referer).path
	end

	def update
    @comment = Comment.find(params[:id])

	    respond_to do |format|
	      if @comment.update_attributes(params[:entry])
	        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @coment.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	before_filter :find_commentable

	def find_commentable
		@commentable = Entry.find(params[:entry_id]) if params[:entry_id]
		@commentable = Comment.find(params[:comment_id]) if params[:comment_id]
	end
end