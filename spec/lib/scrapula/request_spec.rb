describe Scrapula::Request do

  let(:url)  { 'http://example.net' }
  let(:data) { { url: url, method: 'get', params: [{ q: 'lol' }] } }

  subject { described_class.new data }

  describe '#initialize' do

    describe 'requires an URL' do
      %w[http https].each do |protocol|
        context "receives one with the #{protocol.upcase} protocol" do
          let(:url) { "#{protocol}://example.net" }

          it 'maintains it' do
            expect(described_class.new(url: url, method: :get).instance_variable_get :@url).to eq url
          end
        end
      end

      context 'receives one without protocol' do
        let(:url) { 'example.net' }

        it 'adds the HTTP one' do
          expect(described_class.new(url: url, method: :get).instance_variable_get :@url).to eq "http://#{url}"
        end
      end
    end

    describe 'requires a valid HTTP method' do
    end

    describe 'can receive parameters' do
      it 'as an array'
    end
    'or not'

    context 'receives a block'  do
      it "doesn't invoke it now"
    end

  end

  describe '#execute' do

    let(:agent_double) { instance_double Scrapula::Agent }

    let(:page_double) { instance_double Scrapula::Page }

    let(:expects_agent) {
      expect(subject).to receive(:agent).and_return agent_double
    }

    # TODO for each method

    it 'performs an HTTP request using the attributes' do
      expects_agent

      expect(agent_double).to receive(:get) do |*args|
        expect(args[0]).to eq data[:url]
        expect(args[1]).to eq data[:params]

        # TODO other parameters
      end

      subject.execute
    end

    it 'returns the received page' do
      expect(agent_double).to receive(:get).and_return page_double
      expects_agent

      subject.execute
    end

  end

  # TODO agent
  %w[url method params].each do |attribute|

    describe "##{attribute}" do
      it { is_expected.to respond_to attribute }

      it "returns the established #{attribute} of the current request" do
        expect(subject.__send__ attribute).to eq data[attribute.to_sym]
      end
    end

  end
  
end
