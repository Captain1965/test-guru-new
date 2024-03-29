# frozen_string_literal: true

class TestsMailerPreview < ActionMailer::Preview
  def completed_test
    test_passage = TestPassage.new(user: User.first, test: Test.first)

    TestsMailer.completed_test(test_passage)
  end
end
