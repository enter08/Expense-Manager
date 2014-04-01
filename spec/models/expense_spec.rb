require 'spec_helper'

describe Expense do

	let(:user) { FactoryGirl.create(:user) }
	let(:category1) { FactoryGirl.create(:category1) }
	let(:category2) { FactoryGirl.create(:category2) }
	let(:category3) { FactoryGirl.create(:category3) }

  before { @expense = user.expenses.build(description: "Bougth something1", expense_value: "536.23", date: Date.today, category_id: 2) }

  subject { @expense }

	it { should respond_to(:description) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
	  before { @expense.user_id = nil }
		it { should_not be_valid }
	end

	describe "when expense_value is not present" do
		 before { @expense.expense_value = nil }
		 it { should_not be_valid }
	end

	describe "when category_id is not present" do
		 it { should validate_presence_of(:category_id) }
	end

	describe "with blank description" do
		before { @expense.description = "" }
		it { should_not be_invalid }
	end

	describe "with description that is too long" do
		it { should ensure_length_of(:description).is_at_least(0).is_at_most(40).with_message("Description's too long! (max 40 chars)")}
	end
end