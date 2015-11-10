class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    if params[:category]
      Link.where("category = ?", params[@subreddit.links])
    else
      @links = Link.all.sort_by{|link| link.votes.size}.reverse
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link.url
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    if Link.exists?(:url => params[:link][:url])
      Link.where(url: params[:link][:url]).first.votes.create
      redirect_to(subreddit_links_path)
    else
    respond_to do |format|
      if @link.save
        format.html { redirect_to subreddit_links_path, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    if Link.exists?(:url => params[:link][:url])
      Link.where(url: params[:link][:url]).first.votes.create
      redirect_to(subreddit_links_path)
    else
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to subreddit_links_path, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.votes.create
    if params[:upvote]
      redirect_to(root_url)
    else
      redirect_to @link.url
    end
  end

  def downvote
    @link = Link.find(params[:id])
    unless @link.votes.empty?
      @link.votes.first.destroy
    end
    if params[:downvote]
      redirect_to(root_url)
    else
      redirect_to @link.url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, :summary, :user_id)
    end
end
