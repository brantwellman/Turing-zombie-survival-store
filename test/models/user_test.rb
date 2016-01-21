require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "returns full address in string" do
    user = create(:user)
    expected = "1510 Blake St, Denver, CO, 80202"

    assert_equal expected, user.full_street_address
  end
end
