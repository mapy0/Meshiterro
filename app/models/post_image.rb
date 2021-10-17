class PostImage < ApplicationRecord
  #User model関連づけ
  belongs_to :user
  #画像アップ用のメソッド
  attachment :image
  #コメント関連づけ
  has_many :post_comments, dependent: :destroy
  #favorite関連づけ
  has_many :favorites, dependent: :destroy

  #favorited_by?メソッド:引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するか調べる。
  #存在していればtrue、存在していなければfalseを返す。Viewで使う
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
