Rails.application.routes.draw do
  get 'template/estimate'

  get 'template/estimate_subworking'

  get 'template/estimate_subworking_specialist'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
