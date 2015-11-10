require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = posts(:post)
	end

	test "post should be valid" do
		assert @post.valid?
	end

	test "empty title should be invalid" do
		@post.title = ""
		assert @post.invalid?
	end

	test "empty body should be invalid" do
		@post.body = ""
		assert @post.invalid?
	end

	test "body should be less than 1000 characters" do
		@post.body = "a" * 10001
		assert @post.invalid?
	end

end
