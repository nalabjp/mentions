require 'test_helper'

class Webhooks::From::GithubTest < ActiveSupport::TestCase
  def test_comment
    %w(commit_comment
       issue_comment
       pull_request
       issues
       pull_request_review_comment).each do |event|

      payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")[event]['body']
      github = Webhooks::From::Github.new(payload: payload)

      assert_equal "#{event} body", github.comment
    end
  end

  def test_assigned
    %w(assigned_issue
       assigned_pull_request).each do |event|

      payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")[event]['body']
      github = Webhooks::From::Github.new(payload: payload)

      assert github.assigned?
      assert_equal 'assigned', github.comment
      assert_equal ['ppworks'], github.mentions
    end
  end
end
