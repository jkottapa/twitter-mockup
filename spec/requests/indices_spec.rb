require 'spec_helper'

describe "Indices" do

	subject { page }

	describe "Home page" do
		before { visit root_path }
		it { should have_content('Twitter Mock') }
		it { should have_title(full_title('')) }
		it { should_not have_title(" | Home") }		
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
