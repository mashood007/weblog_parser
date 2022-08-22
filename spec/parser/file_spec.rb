# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::File do
  subject { described_class.new(filename) }

  describe '#initialize validation falied' do
    let(:filename) { 'webserve.log' }

    it 'create object, unvalid filename' do
      expect(subject.valid?).to eq(false)
    end
  end

  describe '#initialize validation success' do
    let(:filename) { 'log/webserver.log' }

    it 'valid name' do
      expect(subject.valid?).to eq(true)
    end
  end
end
