# frozen_string_literal: true

module Parser
  class WebServer
    attr_accessor :records, :views

    def initialize(views)
      @views = views
      @records = []
      parse_lines
    end

    def parse_lines
      views.each_with_index do |row, index|
        line = Parser::Line.new(data: row, index: index)
        @records.push(line) if line.valid?
      end
    end

    def most_views
      format_data(
        @records.each_with_object(Hash.new(0)) { |h1, h2| h2[h1.common_path] += 1 },
        'visits'
      )
    end

    def most_unique_views
      format_data(
        @records.each_with_object(Hash.new(0)) { |h1, h2| h2[h1.path] += 1 },
        'unique views'
      )
    end

    protected

    def format_data(data, text)
      data = data.sort_by { |_k, v| v }.reverse
      data.each { |row| puts "#{row[0]} #{row[1]} #{text}" }
    end
  end
end
