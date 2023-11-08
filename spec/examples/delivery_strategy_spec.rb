require_relative '../../examples/strategy/delivery_strategy'

RSpec.describe DeliveryStrategy, '#strategy_pattern' do
  context 'with correios rules' do
    it 'show correio delivery cost' do
      delivery = described_class.new('somewhere', 'correios')
      expect(delivery.cost).to eql 20
    end
    it 'show correio delivery distance' do
      delivery = described_class.new('somewhere', 'correios')
      expect(delivery.distance).to eql '500 km'
    end
  end

  context 'with tele_entrega rules' do
    it 'show tele entrega delivery cost' do
      delivery = described_class.new('somewhere', 'tele_entrega')
      expect(delivery.cost).to eql 30
    end
    it 'show tele entrega delivery distance' do
      delivery = described_class.new('somewhere', 'tele_entrega')
      expect(delivery.distance).to eql '500 km'
    end
  end

  context 'with fedex rules' do
    it 'show fedex delivery cost' do
      delivery = described_class.new('somewhere', 'fedex')
      expect(delivery.cost).to eql 80
    end
    it 'show fedex delivery distance' do
      delivery = described_class.new('somewhere', 'fedex')
      expect(delivery.distance).to eql '500 km'
    end
  end
end