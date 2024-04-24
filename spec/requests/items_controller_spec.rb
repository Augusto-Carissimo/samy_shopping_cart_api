# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @items' do
      items = FactoryBot.create_list(:item, 3)
      get :index
      expect(assigns(:items)).to eq(items)
    end

    it 'assigns @product' do
      get :index
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'assigns @event' do
      get :index
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
