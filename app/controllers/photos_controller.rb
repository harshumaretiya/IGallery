class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_album

  #load_and_authorize_resource   

  # GET /photos
  # GET /photos.json
  def index
    binding.pry
    @photos = @album.photos.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = @album.photos.find params[:id]
  end

  # GET /photos/new
  def new
    @photo = @album.photos.new
  end

  # GET /photos/1/edit
  def edit
    @photo = @album.photos.find params[:id]
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @album.photos.build(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to album_photos_path, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: album_photos_path}
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)  
        format.html { redirect_to album_photo_path, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: album_photos_path }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    redirect_to album_photos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:photo_name, :photo_title, :image, tags_attributes: [:id, :_destroy, :photo_id, :name])
    end

    def set_album
      @album = Album.find(params[:album_id])
    end
end
