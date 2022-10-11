# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses, except: %w[show] do
        resources :chapters, except: %w[show] do
          resources :units, expect: %w[show]
        end
      end
    end
  end
end
