describe Scrapula::Page::Meta do

  let(:page) { Scrapula::Request.new(url: url, method: :get).execute }
  subject { described_class.new page }

  describe '#initialize' do
  end

  describe '#[]' do
    use_vcr_cassette

    let(:url) { 'ogp.me' }

    it 'symbols'

    # TODO Unknown meta or meta does not have value

    it '"charset" meta' do
      expect(subject['charset']).to eq 'utf-8'
    end

    describe 'pragma directives' do
    end

    describe 'standard names' do
      use_vcr_cassette

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

    describe 'Open Graph' do
      use_vcr_cassette

      let(:url) { 'ogp.me' }

      it '"og:title" meta' do
        expect(subject['og:title']).to eq 'Open Graph protocol'
      end

      it '"og:image:height" meta' do
        expect(subject['og:image:height']).to eq '300'
      end
    end

    describe 'other pragma directives' do
    end

    describe 'other names' do
      use_vcr_cassette

      let(:url) { 'https://dev.twitter.com/cards/markup' }

      it '"twitter:title" meta' do
        expect(subject['twitter:title']).to eq 'Cards Markup Tag Reference'
      end
    end
  end

end
