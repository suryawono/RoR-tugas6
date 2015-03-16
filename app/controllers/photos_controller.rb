class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(params_photo)
    if @photo.save
      redirect_to photos_path, :notice => "Upload image #{@photo.title} success"
    else
      render "new", :error => "Upload image #{@photo.title} failed"
    end
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(params_photo)
      redirect_to photos_path, :notice => "Update image #{@photo.title} success"
    else
      render "new", :error => "Update image #{@photo.title} failed"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to photos_path, :notice => "Delete photo #{@photo.title} success"
    else
      redirect_to photos_path, :error => "Delete photo #{@photo.title} failed"
    end
  end

  private
    def params_photo
      params.require(:photo).permit(:title, :photo_file_name)
    end
end
