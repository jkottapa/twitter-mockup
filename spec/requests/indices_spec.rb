require 'spec_helper'

describe "Indices" do

	describe "Home page" do
		it "should have the content 'Twitter Mock'" do
			visit '/index/home'
			expect(page).to have_content('Twitter Mock')
		end

		it "should have the title 'Home'" do
			visit '/index/home'
			expect(page).to have_title("Twitter Mock | Home")
		end
	end

	describe "About page" do

		it "should have the content 'About Me'" do
			visit '/index/about'
			expect(page).to have_content('About Me')
		end

		it "should have the title 'About Me'" do
			visit '/index/about'
			expect(page).to have_title("Twitter Mock | About Me")
		end
	end
end
