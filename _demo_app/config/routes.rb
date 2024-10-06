Rails.application.routes.draw do
  get "/", controller: "blogs", action: :new
  post "/", controller: "blogs", action: :create, as: :blogs
end
