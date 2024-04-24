# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item do
  describe 'associations' do
    it { is_expected.to have_many(:cart_items) }
  end

  describe 'validation' do
    it { is_expected.to validate_numericality_of(:stock).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end
end
