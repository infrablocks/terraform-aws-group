# frozen_string_literal: true

require 'spec_helper'

describe 'group' do
  describe 'by default' do
    before(:context) do
      @group_name = 'test-group'
      @group_members = [
        output(role: :prerequisites, name: 'user_1_name'),
        output(role: :prerequisites, name: 'user_2_name'),
        output(role: :prerequisites, name: 'user_3_name')
      ]
      @group_policies = %w[
        arn:aws:iam::aws:policy/ReadOnlyAccess
        arn:aws:iam::aws:policy/job-function/Billing
      ]

      @plan = plan(role: :root) do |vars|
        vars.group_name = @group_name
        vars.group_members = @group_members
        vars.group_policies = @group_policies
      end
    end

    it 'outputs the group ARN' do
      expect(@plan)
        .to(include_output_creation(name: 'group_arn'))
    end

    it 'creates a group with the provided name' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_iam_group')
              .with_attribute_value(:name, @group_name))
    end

    it 'makes all specified users members of the group' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_iam_group_membership')
              .with_attribute_value(:name, "#{@group_name}-membership")
              .with_attribute_value(:group, @group_name)
              .with_attribute_value(:users, @group_members))
    end

    it 'attaches all specified policies to the group' do
      @group_policies.each do |policy_arn|
        expect(@plan)
          .to(include_resource_creation(type: 'aws_iam_group_policy_attachment')
                .with_attribute_value(:group, @group_name)
                .with_attribute_value(:policy_arn, policy_arn))
      end
    end
  end
end
