require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { build(:recipe) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  it { is_expected.to validate_presence_of(:title) }
end
