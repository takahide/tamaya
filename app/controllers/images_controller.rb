class ImagesController < ApplicationController
  protect_from_forgery with: :null_session
  def download
    image = Image.find_by_tag(params[:time])
    if image.present?
      send_data image.data, type: "image/png", disposition: 'inline'
    else
      redirect_to "http://us.123rf.com/450wm/sgoodwin4813/sgoodwin48131007/sgoodwin4813100700006/7442379-%E9%BB%92%E3%81%84%E5%A4%9C%E7%A9%BA%E3%81%AE%E6%AD%A3%E6%96%B9%E5%BD%A2%E3%81%AB%E5%AF%BE%E3%81%97%E3%81%A6%E8%89%B2%E3%81%A8%E3%82%8A%E3%81%A9%E3%82%8A%E3%81%AE%E8%8A%B1%E7%81%AB.jpg"
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
