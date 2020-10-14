Rails.application.routes.draw do
  get 'users/new'

  get 'mypage/' => 'mypages#index'
end
