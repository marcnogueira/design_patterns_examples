require_relative '../../examples/strategy/delivery_strategy'

RSpec.describe DeliveryStrategy, '#strategy_pattern' do
  context 'with correios rules' do
    let(:correios_delivery) {described_class.new('somewhere', 'correios')}
    
    it 'show correio delivery cost' do
      expect(correios_delivery.cost).to eql 20
    end

    it 'show correio delivery distance' do
      expect(correios_delivery.distance).to eql '500 km'
    end
  end

  context 'with tele_entrega rules' do
    let(:tele_entrega_delivery) {described_class.new('somewhere', 'tele_entrega')}

    it 'show tele entrega delivery cost' do
      expect(tele_entrega_delivery.cost).to eql 30
    end

    it 'show tele entrega delivery distance' do
      expect(tele_entrega_delivery.distance).to eql '500 km'
    end
  end

  context 'with fedex rules' do
    let(:fedex_delivery) {described_class.new('somewhere', 'fedex')}

    it 'show fedex delivery cost' do
      expect(fedex_delivery.cost).to eql 80
    end

    it 'show fedex delivery distance' do
      expect(fedex_delivery.distance).to eql '500 km'
    end
  end

  context 'with nonexistent strategy' do
    it 'raise name error' do
      expect{described_class.new('somewhere', 'somehow')}.to raise_error(NameError)
    end
  end
end