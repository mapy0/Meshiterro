Rails.application.routes.draw do
  #get 'users/show' mypage作成時自動作成のため削除
 devise_for :users
  root to: 'homes#top'
    
    #画像投稿  
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
     resource :favorites, only: [:create, :destroy] #resourceに注目。単数にすると、そのコントローラのidがリクエストに含まれなくなる。
    #いいねの詳細ページは作成しない。favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなる。
    #コメント投稿
    resources :post_comments, only: [:create, :destroy]
    end
    #do と end で繋いで画像投稿とコメント投稿を親子関係づける(=ネストする)
    
    resources :users, only: [:show] #mypage 
    
    resources :users, only: [:show, :edit, :update]#mypage編集 表示して　編集して　更新！


end