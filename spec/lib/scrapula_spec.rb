require 'scrapula'

# TODO doubles
describe Scrapula do

	describe 'get http method' do

		subject { Scrapula.get 'twitter.com' }

		describe '#title' do
			it 'gets the title' do
				subject.title.should == 'Twitter'
			end
		end

		describe '#meta' do
			it 'should return all entries' do
				subject.meta.should == [
					{'charset' => 'utf-8'},
					{'X-UA-Compatible' => 'IE=edge,chrome=1'},
					{'description' => "Instantly connect to what's most important to you. Follow your friends, experts, favorite celebrities, and breaking news."}
				]
			end
		end

		describe 'block' do
			it "should accept a block" do
				Scrapula.get('twitter.com') { int('.copyright').should == 2012 }
			end
		end

		describe '#anchor (alias #link)' do
			it 'should get an anchor' do
				subject.anchor('.footer.inline-list li:first a').should == ['About', '/about']
			end

			it 'should return all the anchors' do
				pending
				subject.anchor.should == [
					[]
				]
			end
		end

		describe '#int' do
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
				subject.nodes('label.placeholder') do |node, result|
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

	describe '#page' do
		
	end

	describe '#table' do
		
	end

	describe '#go' do
		describe 'query not found' do
			pending
			it "throws an error" do
			end
		end
	end

	# TODO
	describe '#request' do
		describe 'cache' do
		end
	end
end
