describe "Integration Test" do
  let!(:user) { Fabricate(:user) }

  before(:each) do
    login_user_post("admin", "admin")
  end

  context "when I visit a page" do
    it "show awesome things" do
      #Test stuff
    end
  end
end
