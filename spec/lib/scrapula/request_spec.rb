describe Scrapula::Request do

  let(:url) { 'example.net' }

  describe '#initialize' do

    describe 'requires an URL' do
      context 'receives one without the HTTP protocol' do
        it 'adds it'
      end
    end

    describe 'requires a valid HTTP method' do
    end

    describe 'can receive parameters' do
    end
    'or not'

    context 'receives a block'  do
      it "doesn't invoke it now"
    end

  end

  describe '#execute' do

    it 'performs an HTTP request to the URL with the params'

    it 'returns the response'

    #     context 'after receiving the page' do
    #       it 'creates a new scraper'
    #     end

  end

  %w[url method params].each do |attribute|

    describe "##{attribute}" do
      let(:data) { { url: url, method: 'get', params: { q: 'lol' } } }
      subject { described_class.new data }

      it { is_expected.to respond_to attribute }

      it "returns the established #{attribute} of the current request" do
        expect(subject.__send__ attribute).to eq data[attribute.to_sym]
      end
    end

  end
  
end
