require 'scrapula'

describe Scrapula do

	describe 'get http method' do

		subject { Scrapula.get 'twitter.com' }

		describe '#anchor' do
			it 'should get an anchor' do
				subject.anchor('.footer.inline-list li:first a').should == ['About', '/about']
			end
		end

		# TODO link alias

		describe '#int' do
			# TODO 4,123 567.789
			it 'should get an integer' do
				subject.int('.copyright').should == 2012
			end
		end

		describe '#nodes' do
			it 'should get Nokogiri nodes' do
				subject.nodes '.footer.inline-list li' do |node, result|
					node.should be_an_instance_of Nokogiri::XML::Element
				end.should have_at_least(14).items
			end

			it 'should return an array of results' do
				subject.nodes('span.placeholder') do |node, result|
					result[:t] = node.text
				end.should == [{t: "Username or email"}, {t: "Password"}, {t: "Full name"}, {t: "Email"}, {t: "Password"}]
			end
		end

	end

	describe 'post http method' do

		subject do
			Scrapula.post 'www.linux.org/search', { search_term: 'happy, happy, happy', search_type: 'Articles' }
		end

		it 'should send a search form' do
			subject.nodes('.search_results li') do |node, result|
				result[:msg] = node.text
			end.should have_at_least(7).items.each {|i| i[:msg].should be_an_instance_of(String) }
		end

	end

	describe 'block' do
		it "should accept a block" do
			Scrapula.get('twitter.com') { int('.copyright').should == 2012 }
		end
	end

	# TODO
	describe 'cache' do
		
	end
end
