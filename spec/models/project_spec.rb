require 'spec_helper'

describe Project do
  	
  	let!(:project) { FactoryGirl.create(:project, goal: 1000) }
  	let!(:pledge1) {FactoryGirl.create(:pledge, project: project, amount: 300)}
		let!(:pledge2) {FactoryGirl.create(:pledge, project: project)}
	it "should calculate the sum of all the pledge amounts" do

		expect(project.raised).to eq(400)
	end

	it "should calculate the percentage of completion" do
		expect(project.percent_raised).to eq(40)
		
		project2 = FactoryGirl.create(:project, goal: 4000)
		pledge3 = FactoryGirl.create(:pledge, project: project2)

		expect(project2.percent_raised).to eq(2)
	end

end
