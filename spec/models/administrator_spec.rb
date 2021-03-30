require 'rails_helper'

RSpec.describe Administrator, type: :model do
  let(:administrator) { FactoryBot.create(:administrator) }

  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it { expect(administrator).to allow_value("aaaa2344").for(:password) }
    it { expect(administrator).to_not allow_value("aaaa234").for(:password) }
    it { expect(administrator).to_not allow_value("11112344").for(:password) }
  end
end
