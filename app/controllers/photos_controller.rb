class PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def show

  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Successfully created new Photo"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was Successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  def upvote
    @photo.upvote_by current_user
    redirect_to :back
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end

end
