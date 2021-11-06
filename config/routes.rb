Rails.application.routes.draw do
  namespace :api do
    resources(:questions, only: :index)
  end
end
