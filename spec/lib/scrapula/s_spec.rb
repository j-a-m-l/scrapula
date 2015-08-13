require_relative '../../../lib/scrapula/s'

describe 'S' do
  
  describe '()' do
    it 'implicit GET request' do
      expect(Scrapula).to receive(:get)
      S('url')
    end

    it 'returns'

    context 'with block' do
    end
  end

  Scrapula::HTTP_METHODS.each do |http_method|
    describe ".#{http_method.to_s}" do
      it "explicit #{http_method.to_s.upcase} request" do
        expect(Scrapula).to receive(http_method)
        S.__send__ http_method, 'url'
      end

      it 'returns'

      context 'with block' do
      end
    end
  end

end
