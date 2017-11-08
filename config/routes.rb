Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/create'

  get 'questions/update'

  get 'questions/new'

  get 'questions/edit'

  get 'questions/show'

  get 'questions/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
