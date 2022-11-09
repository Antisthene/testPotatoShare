namespace :api do
  namespace :v1 do
    resources :potato_shares, only: %i[index]
  end
end
