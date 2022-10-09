# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses do
        resources :chapters, except: %w[show]
      end
    end
  end
end
