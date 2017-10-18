require 'spec_helper'

DatabaseCleaner.strategy = :truncation


DatabaseCleaner.clean

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
    before {@micropost = user.microposts.build(content: "idite na hui")}

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }


  it {should be_valid}

  describe "when user_id is not present" do
    before {@micropost.user_id = nil }
    it { should_not be_valid}
  end
end
