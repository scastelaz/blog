class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

 	def new
	    @comment = Comment.new

    	respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @comment }
    	end
  	end

	def create
		
		@comment = Comment.new(params[:entry])
		if @comment.save
			flash[:notice] = "Successfully created comment."
			redirect_to :id => nil
		else
			render :action => 'new'
		end
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