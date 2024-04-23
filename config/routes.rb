# frozen_string_literal: true

Rails.application.routes.draw do
  root "carts#index"
  resources :items
  patch '/cart_items/:id/increase_quantity', to: 'cart_items#increase_quantity', as: 'increase_cart_item_quantity'
  patch '/cart_items/:id/decrease_quantity', to: 'cart_items#decrease_quantity', as: 'decrease_cart_item_quantity'
  patch '/items/:id/update_price', to: 'items#update_price', as: 'update_price_item'
  patch '/items/:id/increase_stock', to: 'items#increase_stock', as: 'increase_item_stock'
  patch '/items/:id/decrease_stock', to: 'items#decrease_stock', as: 'decrease_item_stock'
end
