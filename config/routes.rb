Rails.application.routes.draw do
  get "/all_products" => "products#everything"
  get "/individual" => "products#individual"
end
