class SubredditsController < ApplicationController
  before_action :set_subreddit, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index

  end

  # GET /links/1
  # GET /links/1.json
  def show
    @subreddit.category
  end

  # GET /links/new
  def new
    @subreddit = Subreddit.new
    @subreddit.parent =Subreddit.find(params[:id])unless params[:id].nil?
  end

  # GET /links/1/edit
  def edit
    @subreddit = Subreddit.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @subreddit = Subreddit.new(subreddit_params)
    respond_to do |format|
      if @subreddit.save
        format.html { redirect_to links_path, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @subreddit }
      else
        format.html { render :new }
        format.json { render json: @subreddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @subreddit.update(subreddit_params)
        format.html { redirect_to links_path, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @subreddit }
      else
        format.html { render :edit }
        format.json { render json: @subreddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @subreddit = Subreddit.find(params[:id])
    @subreddit.destroy
    respond_to do |format|
      format.html { redirect_to subreddit_path, notice: 'Subreddit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subreddit
      @subreddit = Subreddit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subreddit_params
      params.require(:subreddit).permit(:category)
    end
end
