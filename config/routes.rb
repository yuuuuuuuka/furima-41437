Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items do
  resources :orders, only: [:index, :create]
 end 

end
#itemの子ネストにorderを入れた方が良い？
#アソシエーションのみで十分？
#addressはoderコントローラの中にあるからrルーティングに持たせる必要ない
