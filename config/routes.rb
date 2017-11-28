Rails.application.routes.draw do

  get 'acomments/edit'

  get 'qcomments/edit'

  get 'qcomments/new'

  get 'qcomments/create'

  get 'qcomments/destroy'

  get 'acomments/new'

  get 'acomments/create'

  get 'acomments/destroy'

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
  
end
