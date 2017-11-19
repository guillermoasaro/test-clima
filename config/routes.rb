Rails.application.routes.draw do
  get 'areas/' => 'areas#index'

  get 'areas/:id' => 'areas#show'

  get 'areas/:id/add/' => 'areas#add'

  get 'areas/:id/update/' => 'areas#update'

  root to: 'areas#index'
end
