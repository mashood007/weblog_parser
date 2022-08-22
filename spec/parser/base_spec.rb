# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::Base do
  describe '#initialize' do
    subject { described_class.new(filename: 'log/webserver.log') }

    it 'have call method' do
      expect(subject).to respond_to(:call)
    end
  end
end
