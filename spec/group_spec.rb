require 'spec_helper'

describe 'user' do
  let(:group_name) { vars.group_name }
  let(:group_arn) { output_for(:harness, 'group_arn') }

  let(:group_policies) { vars.group_policies }

  let(:user_1_arn) { output_for(:prerequisites, 'user_1_arn') }
  let(:user_2_arn) { output_for(:prerequisites, 'user_2_arn') }
  let(:user_3_arn) { output_for(:prerequisites, 'user_3_arn') }

  subject {
    iam_group(group_name)
  }

  it { should exist }
  its(:arn) { should eq(group_arn) }

  it { should have_iam_user(user_1_arn) }
  it { should have_iam_user(user_2_arn) }
  it { should have_iam_user(user_3_arn) }

  it 'has specified group policies' do
    group_policies.each do |group_policy|
      expect(subject).to(have_iam_policy(group_policy))
    end
  end
end
