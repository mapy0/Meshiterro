class PostImage < ApplicationRecord
  #User model関連づけ
  belongs_to :user
  #画像アップ用のメソッド
  attachment :image
  
end
