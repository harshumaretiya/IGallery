class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

   load_and_authorize_resource
  #  for  load_and_authorize_resource   -- no need to do in edit
  
  # GET /albums
  # GET /albums.json
  def index
    #@albums = current_user.albums#.paginate(:page => params[:page], :per_page => 5)
    #@albums = Album.paginate(:page => params[:page], :per_page => 5)
    if params[:id]
      # get all records with id less than 'our last id'
      # and limit the results to 5
      @albums = current_user.albums.where('id < ?', params[:id]).limit(1)
    else
      @albums = current_user.albums.limit(1)
    end
    respond_to do |format|
      format.js { render 'index'}
      format.html
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = current_user.albums.build
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
    #authorize! :edit, @album  user can not got to /albums/7/edit cancan acces denied
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = current_user.albums.build(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name, :album_title,:image, :start_date)
    end
end
