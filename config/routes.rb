Rails.application.routes.draw do
  get 'status' => 'root#status'
  post 'upgrade' => 'root#upgrade'

  root to: "root#index"
end
