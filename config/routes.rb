Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items
  # Defines the root path route ("/")
  # root "articles#index"
end


#ログイン機能・新規登録機能にアクセスまで完了
#このあとは、会員登録・ログインっボタンを押した時にエラーハンドリングができるというところからスタート
