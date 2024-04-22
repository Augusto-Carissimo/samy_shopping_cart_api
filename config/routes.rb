# frozen_string_literal: true

Rails.application.routes.draw do
  root "carts#index"
  patch '/cart_items/:id/increase_quantity', to: 'cart_items#increase_quantity', as: 'increase_cart_item_quantity'
  patch '/cart_items/:id/decrease_quantity', to: 'cart_items#decrease_quantity', as: 'decrease_cart_item_quantity'

  resources :carts
  resources :items
end
