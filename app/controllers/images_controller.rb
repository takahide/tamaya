class ImagesController < ApplicationController
  protect_from_forgery with: :null_session
  def show
    image = Image.find(params[:id])
    render json: image, except: [:data]
  end

  def download
    image = Image.find_by_tag(params[:time])
    if image.present?
      send_data image.data, type: "image/png", disposition: 'inline'
    else
      redirect_to "/tamaya_button.png"
    end
  end

  def upload
    image = []
    Image.where(tag: params[:time]).first_or_create do |i|
      i.data = request.raw_post
      image = i
    end
    render json: image, except: [:data]
  end
end
