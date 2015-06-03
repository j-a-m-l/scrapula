describe Scrapula::Page do

  let(:query) { '.example' }

  let(:agent_page_double) { instance_double Mechanize::Page }

  describe '#initialize' do
    it 'requires a Mechanize::Page'
  end

  describe '#scrape' do
    subject { described_class.new agent_page_double }

    let(:scraper_double) { instance_double Scrapula::Scraper }

    let(:expect_new_scraper) {
      expect(Scrapula::Scraper).to receive(:new).and_return scraper_double
    }

    it 'creates a scraper for the page' do
      expect_new_scraper
      subject.scrape & proc{}
    end
    
    it 'returns the scrapped data' do
      expect_new_scraper

      result = subject.scrape do
        example '#example'
      end

      expect(result).to eq({ example: 'example value' })
    end
  end

  describe '#at!' do

    subject { described_class.new agent_page_double }

    let(:page_search_result_double) { instance_double Nokogiri::XML::NodeSet }

    let(:expects_page_search) {
      allow(agent_page_double).to receive(:at).and_return page_search_result_double
    }

    it 'requires a query' do
      expect { subject.at! [] }.to raise_error
    end

    it 'performs the query' do
      expects_page_search
      expect(agent_page_double).to receive(:at)

      subject.at! query
    end

    context 'without receiving an array with operations'  do
      it 'returns the query result' do
        expects_page_search

        expect(subject.at! query).to be page_search_result_double
      end
    end

    context 'receiving an array with method names'  do
      
      let(:operations)          { [:to_s, :upcase, :length] }
      let(:example_string)      { "You FOOL! This isn't even my final form!" }
      let(:transformed_example) { example_string.upcase.length }

      let(:expects_scraping_using_at) {
        expects_page_search.with query
        expect(page_search_result_double).to receive(:to_s).and_return example_string
      }

      context 'but not receiving a block' do
        it 'applies them in order to the result' do
          expects_scraping_using_at

          expect(subject.at!(query, operations)).to eq transformed_example
        end
      end

      context 'and a block' do
        it 'applies them in order to the result and yields that value' do
          expects_scraping_using_at

          expect {|b| subject.at!(query, operations, &b) }.to yield_with_args transformed_example
        end
      end
    end
    
  end

  describe '#html!' do

    subject { described_class.new agent_page_double }

    it 'performs the query' do
      expect(subject).to receive(:at!).with query, any_args
      subject.html! query
    end

    context 'without operations' do
      it 'adds one for converting to HTML'
    end

    describe 'with operations' do
      it 'prepends them for converting first to HTML'
    end

    describe 'block' do
    end

  end

  describe '#text!' do
    it 'performs the query'

    it 'returns the inner text'
  end
  
end
