# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @items' do
      items = FactoryBot.create_list(:item, 3)
      get :index
      expect(assigns(:items)).to eq(items)
    end

    it 'assigns @cart' do
      cart = FactoryBot.create(:cart)
      get :index
      expect(assigns(:cart)).to eq(cart)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
