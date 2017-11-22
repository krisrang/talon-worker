require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  get 'status' => 'root#status'
  post 'upgrade' => 'root#upgrade'

  root to: "root#index"
end
