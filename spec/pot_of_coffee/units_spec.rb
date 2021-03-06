# frozen_string_literal: true

RSpec.shared_examples "a correct unit" do
  describe "#name" do
    subject { units.name }
    it { is_expected.to be_a(String) }
  end

  describe "#abbreviation" do
    subject { units.abbreviation }
    it { is_expected.to be_a(String) }
  end

  describe "#table" do
    subject { units.table }
    it { is_expected.to(satisfy { |t| %i[weak medium strong].each { |key| t.keys.include?(key) } }) }
  end
end

RSpec.describe PotOfCoffee::Units do
  describe "Imperial" do
    let(:units) { PotOfCoffee::Units::Imperial }

    it_behaves_like "a correct unit"
  end

  describe "Metric" do
    let(:units) { PotOfCoffee::Units::Metric }

    it_behaves_like "a correct unit"
  end
end
