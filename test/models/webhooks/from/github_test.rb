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

      assert github.accept?
      assert_equal "#{event} body", github.comment
    end
  end

  def test_assigned
    %w(assigned_issue
       assigned_pull_request).each do |event|

      payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")[event]['body']
      github = Webhooks::From::Github.new(payload: payload)

      assert github.accept?
      assert github.assigned?
      assert_equal 'assigned', github.comment
      assert_equal ['ppworks'], github.mentions
    end
  end

  def test_review_requested
    %w(review_requested_pull_request).each do |event|
      payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")[event]['body']
      github = Webhooks::From::Github.new(payload: payload)

      assert github.accept?
      assert github.review_requested?
      assert_equal 'review requested', github.comment
      assert_equal ['ppworks'], github.mentions
    end
  end

  def test_additional_message_of_pull_request
    %w(pull_request
      pull_request_review_comment).each do |event|
      payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")[event]['body']
      github = Webhooks::From::Github.new(payload: payload)

      assert github.additional_message.include?('*Update the README with new information*')
    end
  end

  def test_additional_message_of_issue
    %w(issue_comment
       issues).each do |event|
      payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")[event]['body']
      github = Webhooks::From::Github.new(payload: payload)

      assert_equal "*Spelling error in the README file* you've been mentioned", github.additional_message
    end
  end

  def test_additional_message_of_commit
    payload = YAML.load_file("#{Rails.root}/test/payloads/github_payloads.yml")['commit_comment']['body']
    github = Webhooks::From::Github.new(payload: payload)

    assert_equal "you've been mentioned", github.additional_message
  end

  def test_accept?
    %w(created
       opened
       assigned
       review_requested).each do |action|

      payload = { action: action }.to_json
      github = Webhooks::From::Github.new(payload: payload)

      assert github.accept?
    end
  end

  def test_does_not_accept?
    payload = { action: 'synchronize' }.to_json
    github = Webhooks::From::Github.new(payload: payload)

    assert !github.accept?
  end
end
