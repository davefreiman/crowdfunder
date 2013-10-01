require 'spec_helper'

describe "Project Listing" do
  describe "when visiting the index page" do
    it "should display all projects" do
      # Create three projects
      project1 = FactoryGirl.create(:project, :title => "Project 1")
      project2 = FactoryGirl.create(:project, :title => "Project 2")
      project3 = FactoryGirl.create(:project, :title => "Project 3")

      # Go to the page with the projects
      visit "/projects"
      # Expect the page we're on is the page with the projects
      expect(current_path).to eq(projects_path)

      # Expect this page has the words 'Listing Projects'
      page.should have_content('Listing projects')
      expect(page).to have_content('Listing projects')

      # Expect this page has these words as well
      page.should have_content('Project 1')
      expect(page).to have_content('Project 1')

      page.should have_content('Project 2')
      expect(page).to have_content('Project 2')

      page.should have_content('Project 3')
      expect(page).to have_content('Project 3')

      click_link('Project 1')
      # Expect we're on project1's show page
      expect(current_path).to eq(project_path(project1))
      # Expect on this page the first h1 has the text project1's title
      page.should have_selector('h1:first', text: project1.title)
      expect(page).to have_selector('h1:first', text: project1.title)
    end

    it "should display the navigation" do
    	project1 = FactoryGirl.create(:project, :title => "Project 1")

      visit "/"

    	expect(current_path).to eq(root_path)
    	page.should have_selector(".navbar ul li.active a", text: "Home")
    	expect(page).to have_selector('.navbar ul li.active a', text: "Home")
    	
    	page.find(".navbar ul").click_link("Projects")
    	expect(current_path).to eq(projects_path)

    	page.should have_selector(".navbar ul li.active a", text: "Projects")
    	expect(page).to have_selector(".navbar ul li.active a", text: "Projects")

      page.should have_selector('.navbar ul li.active a', count: 1)
      expect(page).to have_selector('.navbar ul li.active a', count: 1)

      click_link 'Project 1'
      page.should have_selector('.navbar ul li.active a', text: "Projects")
      expect(page).to have_selector('.navbar ul li.active a', text: "Projects")
    end

    it "should have pagination" do 
      user = FactoryGirl.create :user
      50.times { |i| FactoryGirl.create(:project, title: "Project #{i}", user: user) }

      visit "/projects"

      # Expect the most recently created projects on page 1 (8 PER PAGE)
      page.should have_content('Project 49')
      expect(page).to have_content('Project 49')

      page.should have_no_content('Project 41')
      expect(page).to have_no_content('Project 41')

      page.should have_selector('li.project', count: 8)
      expect(page).to have_selector('li.project', count: 8)

      # Expect pagination link and click page 2
      page.find('.pagination').click_link '2'

      # Expect page 2 to have the next 8 projects
      page.should have_content('Project 41')
      expect(page).to have_content('Project 41')

      page.should have_no_content('Project 32')
      expect(page).to have_no_content('Project 32')
    end
  end
end