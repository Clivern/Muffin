Rails.application.routes.draw do
  get '_health', to: 'health#index'
end
