# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { product: FactoryBot.attributes_for(:product) } }

      it 'creates a new product' do
        expect do
          post :create, params: valid_params
        end.to change(Product, :count).by(1)
      end

      it 'redirects to products_path on successful creation' do
        post :create, params: valid_params
        expect(response).to redirect_to(items_path)
      end

      it 'sets a flash success message' do
        post :create, params: valid_params
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { product: FactoryBot.attributes_for(:product, name: nil) } }

      it 'does not create a new product' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Product, :count)
      end

      it 'sets a flash error message' do
        post :create, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end
end
