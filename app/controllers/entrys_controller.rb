class EntrysController < ApplicationController

	def index
		@entrys = Entry.all

    	respond_to do |format|
    		format.html # index.html.erb
    	  	format.json { render json: @entrys }
    	end
  	end

  	def show
  		@entry = Entry.find(param[:entry])

  		respond_to do |format|
  			format.html
  			format.json { render json: @entry}
  		end
  	end

  	def new
  		@entry = Entry.new

  		respond_to do |format|
  			formant.html
  			format.json {render json: @entry}
  		end
  	end

  	def edit
  		@entry = Entry.find(param[:entry])
  	end

	def create
		@entry = Entry.create(param[:entry])

		respond_to do |format|
			if @entry.save
				format.html {redirect_to @entry, notice: "Entry successfully created"}
				format.json {render json: @entry, status: :created, location @entry}
			else
				format.html {render action: "new"}
				format.json {render json: @entry.errors, status: :unprocessable_entity}
			end
		end
	end

	def create
		@entry = Entry.create(param[:entry])

		respond_to do |format|
			if @entry.save
				format.html {redirect_to @entry, notice: "Entry successfully updated"}
				format.json { head :no_content}
			else
				format.html {render action: "edit"}
				format.json {render json: @entry.errors, status: :unprocessable_entity}
			end
		end
	end
	
	def destroy
		@entry.Entry.find(param[:entry])
		@entry.destroy

		respond_to do |format|
			format.html{ redirect_to home_url}
			format.json {head :no_content}
		end
	end

end