Rails.application.routes.draw do

  get 'tags/index'

  get 'tags/new'

  get 'tags/create'

  get 'tags/edit'

  get 'tags/update'

  get 'tags/delete'

  get 'tags/destroy'

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

  #Rutas de comentarios
  resources :acomments
  resources :qcomments

  #Rutas de facultades
  resources :faculties

  #Rutas de etiquetas
  resources :tags
  get 'tags/:tag', to: 'questions#index', as: :tag
  
  
end
