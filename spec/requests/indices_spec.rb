require 'spec_helper'

describe "Indices" do

	subject { page }

	describe "Home page" do
		before { visit root_path }
		it { should have_content('Twitter Mock') }
		it { should have_title(full_title('')) }
		it { should_not have_title(" | Home") }		

		describe "for signed-in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "tehehe heheh")
				FactoryGirl.create(:micropost, user: user, content: "tehehe heheh hehehehehehe")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					expect(page).to have_selector("li##{item.id}", text: item.content)
				end	
			end

			describe "follower/following counts" do
				let(:other_user) { FactoryGirl.create(:user)}
				before do
					other_user.follow!(user)
					visit root_path
				end

				it { should have_link("0 following", href: following_user_path(user))}
				it { should have_link("1 followers", href: followers_user_path(user))}
			end
		end
	end

	describe "About page" do
		before { visit about_path }
		it { should have_content('About Me') }
		it { should have_title("About Me") }		
	end

	describe "Contact page" do
		before { visit contact_path }
		it { should have_content('Contact') }
		it { should have_title("Contact") }		
	end
end
