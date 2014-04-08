# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  username         :string(255)      not null
#  email            :string(255)
#  crypted_password :string(255)
#  salt             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  token            :string(255)
#  nombres          :string(255)
#  active           :boolean          default(TRUE)
#

require 'spec_helper'

describe User do
  let(:user) { create :user }

  context "default" do
    describe "active" do
      it { expect(user.active).to be_true }
    end
  end

  describe "#deactivate!" do
    before { user.deactivate! }

    it { expect(user.active).to be_false }
  end
end
