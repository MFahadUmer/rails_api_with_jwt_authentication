require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensures email presense" do
      user = User.new(email: 'eng.fahadumer@gmail.com', password_digest: 'asdfghjkl')
      expect(user).to be_valid
    end

    it "should be invalid due to absence of email" do
      user = User.new(password_digest: 'asdfghjkl')
      expect(user).not_to be_valid
    end

    it "should be invalid due to absence of password" do
      user = User.new(email: 'eng.fahadumer@gmail.com')
      expect(user).not_to be_valid
    end

    it "ensures the length of password between 6 to 20" do
      user = User.new(email: 'eng.fahadumer@gmail.com', password_digest: 'ahjkl')
      expect(user).not_to be_valid
    end

    it "ensures the presence of @ in email" do
      user = User.new(email: 'eng.fahadumergmail.com', password_digest: 'asshjkl')
      expect(user).not_to be_valid
    end
  end
end
