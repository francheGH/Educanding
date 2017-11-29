Rails.application.routes.draw do

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
  resources :acvotes
  resources :qcvotes

  get 'tags/:tag', to: 'questions#index', as: :tag
  
  #Rutas de comentarios
  resources :acomments
  resources :qcomments
  
end
