describe Scrapula::Page::Meta do

  let(:page) { Scrapula::Request.new(url: url, method: :get).execute }
  subject { described_class.new page }

  describe '#initialize' do
  end

  describe '#[]' do
    use_vcr_cassette

    it 'symbols'

    # TODO Unknown meta or meta does not have value
    # FIXME other URL
    let(:url) { 'http://ruby-doc.org/' }

    it '"charset" meta' do
      expect(subject['charset']).to eq 'Webby'
    end

    describe 'standard names' do
      # FIXME other URL
      let(:url) { 'http://ruby-doc.org/' }

      it '"application-name" meta' do
        expect(subject['application-name']).to eq 'Webby'
      end

      it '"author" meta' do
        expect(subject['author']).to eq 'Webby'
      end

      it '"generator" meta' do
        expect(subject['generator']).to eq 'Webby'
      end

      it '"description" meta' do
        expect(subject['description']).to eq 'Fast and searchable Ruby documentation for core, standard libraries, and rubygems. Available in both RDoc and Yard format. Plus, links to tutorials, guides, books, and related sites.'
      end

      it '"keywords" meta' do
        expect(subject['keywords']).to eq 'Webby'
      end
    end

    describe 'Pragma directives' do
    end

    describe 'Open Graph' do
    end

    describe 'Other pragma directives' do
    end

    describe 'Other names' do
    end
  end

end
