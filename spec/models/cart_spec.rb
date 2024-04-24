# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart do
  describe 'associations' do
    it { is_expected.to have_many(:cart_items) }
  end
end
