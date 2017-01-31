require 'test_helper'

=begin
describe Article do
  let(:article) { Article.new }

  it "must be valid" do
    value(article).must_be :valid?
  end
end
=end

class ArticleTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

=begin
  test "new article has default title" do
    a = Article.new
    assert a.title.length > 3
  end
=end
end