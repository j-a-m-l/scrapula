describe Scrapula::Scraper do

  let(:page_double) {
    instance_double Scrapula::Page
  }

  # TODO better test titles
  describe '#initialize' do

    xit 'requires a page' do
    end

    context 'without block' do
    end

    context 'with block' do

      let(:allow_example_query) {
        allow(page_double).to receive(:txt!).with('#example').and_return 'example value'
      }

      let(:allow_out_block) {
        allow(page_double).to receive(:at!)
      }

      describe 'without any query' do
        it 'returns an empty hash' do
          result = described_class.new page_double do
          end
          expect(result.data!).to eq({})
        end
      end

      describe 'and inner attribute' do

        # TODO how to know if it's a value or a query and corner cases (using attr! 'value' for assigning?)
        xcontext 'value' do
          it 'assigns the value to hash' do
            result = described_class.new page_double do
              example 'value'
            end
            expected = { example: 'value' }

            expect(result.data!).to eq expected
          end
        end

        context 'query' do

          shared_examples :query do
            before(:each) {
              expect(page_double).to receive(:txt!).with('.example').and_return expected_value
            }

            it 'extracts the text' do
              described_class.new page_double do
                example '.example'
              end
            end

            it 'assigns the result to a hash' do
              result = described_class.new page_double do
                example '.example'
              end
              expected = { example: expected_value }

              expect(result.data!).to eq expected
            end
          end

          context "that doesn't find anything" do
            it "doesn't crash"
            it 'returns nil'
          end

          context 'that returns only one element' do
            let(:expected_value) { 'example value' }

            include_examples :query
          end

          # TODO
          xcontext 'that returns several elements' do
            let(:expected_value) { %w[value1 value2 value3] }

            include_examples :query
          end
        end

        # TODO how to know if it's a value or a query and corner cases (using attr? for returning values)
        xdescribe 'attributes can be invoked' do
          it 'returns its previous value' do
            allow_example_query

            result = described_class.new page_double do
              example '#example'
              other example
            end
            expected = { example: 'example value', other: 'example value' }

            expect(result.data!).to eq expected
          end
        end
      end

      # TODO how should behaves? ignore the query?
      xdescribe 'with query and inner query' do

        it 'assigns the query result to a hash' do
          allow_out_block.with '#outer', '#out'
          allow_example_query

          result = described_class.new page_double do
            outer '#outer' do
              out '#out' do
                example '#example'
              end
            end
          end
          expected = { outer: { out: { example: 'example value' } } }

          expect(result.data!).to eq expected
        end
        
      end

      describe 'without query and inner query' do

        it 'assigns the query result to a hash' do
          allow_out_block
          allow_example_query

          result = described_class.new page_double do
            outer do
              out do
                example '#example'
              end
            end
          end
          expected = { outer: { out: { example: 'example value' } } }

          expect(result.data!).to eq expected
        end
        
      end
    end

    context 'with block with parameters' do
      it 'yields the page' do
        expect {|b| described_class.new page_double, &b }.to yield_with_args page_double
      end
    end
    
  end

  describe '#method_missing' do
    it 'works only inside a block'

    context 'String as argument' do
      it 'queries the page '
    end

    context 'String and an Array as arguments' do
      it 'queries the page '
      it 'applies the operations '
    end

    context 'block' do
      it 'creates '
    end
  end

  describe '#respond_to?' do
  end

  xdescribe '#execute' do

    subject { described_class.new page_double }

    context 'without block' do
      it 'returns itself' do
        expect(subject.execute).to be subject
      end
    end

    context 'with block' do
      it 'returns the scrapped data'
    end

    context 'block with parameters' do
      it 'yields the page' do
        expect {|b| subject.execute &b }.to yield_with_args page_double
      end
    end
      
  end

  describe '#validate' do
  end
  
end
