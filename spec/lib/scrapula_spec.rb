require 'scrapula'

describe Scrapula do

  let(:url) { 'http://example.com' }

  # TODO
  %w[get].each do |http_method|

    describe ".#{http_method}" do
      it { is_expected.to respond_to http_method }

      describe 'creates a request' do

        let(:args) {
          { url: url, params: [{ q: 'lol' }] }
        }

        let(:request_double) {
          instance_double described_class::Request
        }

        let(:page_double) {
          instance_double Scrapula::Page
        }
        
        let(:expect_new_request) {
          allow(request_double).to receive :execute
          expect(described_class::Request).to receive(:new).and_return request_double
        }

        let(:expect_page_response) {
          expect_new_request
          allow(request_double).to receive(:execute).and_return page_double
        }

        describe 'with the' do
          context 'URL received as String' do
            it 'without parameters' do
              expect_new_request.with hash_including({ url: args[:url] })

              described_class.__send__ http_method, args[:url]
            end

            it 'with parameters' do
              expect_new_request.with hash_including args

              described_class.__send__ http_method, args[:url], args[:params]
            end
          end

          it 'arguments received as Hash' do
            expect_new_request.with hash_including args

            described_class.__send__ http_method, args
          end
        end

        it "inferring the #{http_method.upcase} method" do
          expect_new_request.with hash_including method: http_method

          described_class.__send__ http_method, args
        end

        it 'and executes it' do
          expect(request_double).to receive :execute
          expect(described_class::Request).to receive(:new).and_return request_double

          described_class.__send__ http_method, args
        end

        # TODO
        describe 'when fails' do
        end

        describe 'after receiving the page' do

          context 'without block' do
            it 'returns that page' do
              expect_page_response
              expect(described_class.__send__ http_method, args).to eq page_double
            end
          end

          context 'with block' do

            it 'scrapes that page using that block' do
              expect_page_response

              block = proc{}

              expect(page_double).to receive(:scrape) do |&block|
                expect(block).to be block
              end

              described_class.__send__ http_method, args, &block
            end

            it 'returns the scrapped data' do
              expect_page_response
              expect(page_double).to receive(:scrape).and_return({ example: 'example value' })

              result = described_class.__send__ http_method, args do
                example '#example'
              end

              expect(result).to eq({ example: 'example value' })
            end
          end
        end

      end
    end
  end

  describe '.meta' do
    let(:metas) { double }
    let(:page_double) { instance_double Scrapula::Page }

    it 'performs a GET request' do
      allow(page_double).to receive(:meta!).and_return metas
      expect(described_class).to receive(:get).with(url).and_return page_double
      described_class.meta url
    end

    it 'returns the meta elements of the page' do
      expect(page_double).to receive(:meta!).and_return metas
      allow(described_class).to receive(:get).with(url).and_return page_double
      expect(described_class.meta url).to eq metas
    end
  end

  # TODO
  describe '.metas' do
  end

  describe '.configure' do
    
  end

end
