require 'scrapula'

# TODO doubles, fixtures
describe Scrapula do

  %w[get post].each do |http_method|

    describe ".#{http_method}" do
      it { is_expected.to respond_to http_method }

      describe 'creates a request' do
        let(:args) {
          { url: 'http://example.com', params: { q: 'lol' } }
        }

        it 'with the received arguments' do
          expect(described_class::Request).to receive(:new).with hash_including args
          described_class.__send__ http_method, args
        end

        it "using #{http_method.upcase} method" do
          expect(described_class::Request).to receive(:new).with hash_including(method: http_method)
          described_class.__send__ http_method, args
        end
      end
    end
  end

  describe '.scrape' do

    xit 'creates a request' do
    end

    xit 'executes the request' do
    end

    xit 'scrapes' do
    end

    it 'returns'

  end

  describe '.configure' do
    
  end

# 	# xit 'gets the title' do
# 	# 	subject.title(url).should == 'Twitter'
# 	# end
# 
# 	# xit 'gets the metas' do
# 	# 	subject.metas(url).should == 'Twitter'
# 	# end
# 
# 	describe 'get http method' do
# 
# 		subject { Scrapula.get 'twitter.com' }
# 
# 		describe '#title' do
# 			it 'gets the title' do
# 				subject.title.should == 'Twitter'
# 			end
# 		end
# 
# 		describe '#meta (alias #metas)' do
# 			it 'should return all entries' do
# 				subject.meta.should == {
# 					'charset' => 'utf-8',
# 					'X-UA-Compatible' => 'IE=edge,chrome=1',
# 					'description' => "Instantly connect to what's most important to you. Follow your friends, experts, favorite celebrities, and breaking news.",
# 					'swift-page-name' => 'front'
# 				}
# 			end
# 
# 			xit 'warn about unknown metas' do
# 
# 			end
# 		end
# 
# 		describe 'block' do
# 			it "should accept a block" do
# 				Scrapula.get('twitter.com') { int('.copyright').should == 2012 }
# 			end
# 		end
# 
# 		describe '#anchor (alias #link)' do
# 			it 'should get an anchor' do
# 				subject.anchor('.footer.inline-list li:first a').should == ['About', '/about']
# 			end
# 
# 			it 'should return all the anchors' do
# 				pending
# 				subject.anchor.should == [
# 					[]
# 				]
# 			end
# 		end
# 
# 		describe '#int' do
# 			it 'should get an integer' do
# 				subject.int('.copyright').should == 2012
# 			end
# 		end
# 
# 		describe '#nodes' do
# 			it 'should get Nokogiri nodes' do
# 				subject.nodes '.footer.inline-list li' do |node, result|
# 					node.should be_an_instance_of Nokogiri::XML::Element
# 				end.should have_at_least(14).items
# 			end
# 
# 			it 'should return an array of results' do
# 				subject.nodes('label.placeholder') do |node, result|
# 					result[:t] = node.text
# 				end.should == [{t: "Username or email"}, {t: "Password"}, {t: "Full name"}, {t: "Email"}, {t: "Password"}]
# 			end
# 		end
# 
# 	end
# 
# 	describe 'post http method' do
# 
# 		subject do
# 			Scrapula.post 'www.linux.org/search', { search_term: 'happy, happy, happy', search_type: 'Articles' }
# 		end
# 
# 		it 'should send a search form' do
# 			subject.nodes('.search_results li') do |node, result|
# 				result[:msg] = node.text
# 			end.should have_at_least(7).items.each {|i| i[:msg].should be_an_instance_of(String) }
# 		end
# 
# 	end
# 
# 	describe '#page' do
# 		
# 	end
# 
# 	describe '#table' do
# 		
# 	end
# 
# 	describe '#go' do
# 		describe 'query not found' do
# 			pending
# 			it "throws an error" do
# 			end
# 		end
# 	end
# 
# 	# TODO
# 	describe '#request' do
# 		describe 'cache' do
# 		end
# 	end

end
