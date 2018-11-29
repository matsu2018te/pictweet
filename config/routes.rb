Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]

end

  # get 'tweets'            => 'tweets#index' #ツイート一覧画面
  # get 'tweets/new'        => 'tweets#new' #ツイート新規投稿
  # post 'tweets'           => 'tweets#create' #投稿ツイート保存
  # delete 'tweets/:id'     => 'tweets#destroy'#削除
  # patch 'tweets/:id'      => 'tweets#update'#更新保存
  # get 'tweets/:id/edit'   => 'tweets#edit'#ツイート編集
  # get 'users/:id'         => 'users#show' #Myページへの遷移
  # get 'tweets/:id'        => 'tweets#show'#ツイート詳細ページ
