class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #PostImage model関連づけ       
  has_many :post_images, dependent: :destroy
  #PostComment model 関連づけ
  has_many :post_comments, dependent: :destroy
  #Favorite model 関連づけ
  has_many :favorites, dependent: :destroy
   #プロフィール画像投稿 
  attachment :profile_image
end
