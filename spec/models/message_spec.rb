# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { build :message }
  subject { message }

  describe 'associations' do
    it { is_expected.to respond_to :room }
    it { is_expected.to respond_to :user }

    describe 'room' do
      context 'when not set' do
        before { subject.room_id = nil }

        it { is_expected.to be_invalid }
      end

      context 'when correctly set' do
        subject { message.room }

        it { is_expected.to be_an_instance_of Room }
      end
    end

    describe 'user' do
      context 'when not set' do
        before { subject.user_id = nil }

        it { is_expected.to be_invalid }
      end

      context 'when correctly set' do
        subject { message.user }

        it { is_expected.to be_an_instance_of User }
      end
    end
  end
end
