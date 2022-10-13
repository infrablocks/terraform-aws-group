# frozen_string_literal: true

require 'spec_helper'

describe 'full' do
  before(:context) do
    apply(role: :full)
  end

  after(:context) do
    destroy(role: :full)
  end

  let(:account_id) { account.account }

  let(:deployment_identifier) do
    var(role: :full, name: 'deployment_identifier')
  end

  # rubocop:disable RSpec/MultipleExpectations
  it 'creates a group' do
    created_group = iam_group("test-group-#{deployment_identifier}")
    output_group_arn = output(role: :full, name: 'group_arn')

    expect(created_group).to(exist)
    expect(created_group.arn).to(eq(output_group_arn))
  end
  # rubocop:enable RSpec/MultipleExpectations

  # rubocop:disable RSpec/MultipleExpectations
  it 'adds all users to the group' do
    created_group = iam_group("test-group-#{deployment_identifier}")

    expect(created_group.users.count).to(eq(2))
    %W[
      user-1-#{deployment_identifier}
      user-2-#{deployment_identifier}
    ].each do |defined_user|
      expect(created_group).to(have_iam_user(defined_user))
    end
  end
  # rubocop:enable RSpec/MultipleExpectations

  it 'adds all policies to the group' do
    created_group = iam_group("test-group-#{deployment_identifier}")

    %w[
      arn:aws:iam::aws:policy/ReadOnlyAccess
      arn:aws:iam::aws:policy/job-function/Billing
    ].each do |group_policy|
      expect(created_group).to(have_iam_policy(group_policy))
    end
  end
end
