# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::WebServer do
  let(:view1) { "/help_page/1 126.318.035.038\n" }
  let(:view2) { "/contact 184.123.665.067\n" }
  let(:view3) { "/contact/2 184.123.665.067\n" }
  let(:views) { [view1, view2, view3] }

  subject { described_class.new(views) }

  describe '#initialize' do
    it 'create new WebServer object' do
      expect(subject.records.count).to eq(views.count)
    end
  end

  describe 'most views' do
    let(:most_views) { [['contact', 2], ['help_page', 1]] }

    it 'will be array' do
      expect(subject.most_views).to eq(most_views)
    end
  end

  describe 'most unique views' do
    let(:most_unique_views) { [['/contact/2', 1], ['/contact', 1], ['/help_page/1', 1]] }

    it 'will be array' do
      expect(subject.most_unique_views).to eq(most_unique_views)
    end
  end
end
