# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::Line do
  describe '#initialize' do
    let(:ip) { '200.017.277.774' }
    let(:common_path) { 'about' }
    let(:path) { "/#{common_path}/2" }
    let(:data) { "#{path} #{ip}\n" }
    let(:index) { 0 }

    subject do
      described_class.new(data: data, index: index)
    end

    it 'create new line object' do
      expect(subject.valid?).not_to eq(false)
      expect(subject.path).to eq(path)
      expect(subject.common_path).to eq(common_path)
    end
  end
end
