Rails.application.routes.draw do


  get 'qcomments/new'

  get 'qcomments/create'

  get 'qcomments/destroy'

  get 'qcomments/edit'

  get 'qcomments/update'

  get 'acomments/new'

  get 'acomments/create'

  get 'acomments/destroy'

  get 'acomments/edit'

  get 'acomments/update'

  #Ruta raíz
  root :to => 'questions#index'
  
  #Rutas de devise (usuarios)
  devise_for :users
  
  #Rutas de preguntas
  resources :questions
  
  #Rutas de respuestas
  resources :answers
  
  #Rutas de votos
  resources :avotes
  resources :qvotes

  get 'tags/:tag', to: 'questions#index', as: :tag
  
  #Rutas de comentarios
  resources :acomments
  resources :qcomments
  
end
