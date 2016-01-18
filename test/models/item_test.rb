require "test_helper"

class ItemTest < ActiveSupport::TestCase

  should validate_presence_of(:title)
  should validate_uniqueness_of(:title)
  should validate_presence_of(:description)
  should validate_numericality_of(:price), greater_than: 0
end
