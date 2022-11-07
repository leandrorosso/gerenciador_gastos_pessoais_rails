Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contas
      resources :transacaos
    end
  end
end
