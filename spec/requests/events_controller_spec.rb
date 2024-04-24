# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { event: FactoryBot.attributes_for(:event) } }

      it 'creates a new event' do
        expect do
          post :create, params: valid_params
        end.to change(Event, :count).by(1)
      end

      it 'redirects to items_path on successful creation' do
        post :create, params: valid_params
        expect(response).to redirect_to(items_path)
      end

      it 'sets a flash success message' do
        post :create, params: valid_params
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { event: FactoryBot.attributes_for(:event, name: nil) } }

      it 'does not create a new event' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Event, :count)
      end

      it 'redirects to items_path' do
        post :create, params: invalid_params
        expect(response).to redirect_to(items_path)
      end

      it 'sets a flash error message' do
        post :create, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end
end
