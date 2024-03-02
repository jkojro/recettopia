require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject { build(:ingredient) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
