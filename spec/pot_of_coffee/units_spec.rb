RSpec.shared_examples 'a correct unit' do
  describe '#name' do
    subject { units.name }
    it { is_expected.to be_a(String) }
  end

  describe '#abbreviation' do
    subject { units.abbreviation }
    it { is_expected.to be_a(String) }
  end

  describe '#table' do
    subject { units.table }
    it { is_expected.to satisfy { |t| [:weak, :medium, :strong].each { |key| t.keys.include?(key) } } }
  end
end

RSpec.describe PotOfCoffee::Units do
  describe 'imperial units' do
    let(:units) { PotOfCoffee::Units::Imperial.new }

    it_behaves_like 'a correct unit'
  end

  describe 'metric units' do
    let(:units) { PotOfCoffee::Units::Metric.new }

    it_behaves_like 'a correct unit'
  end
end
