# frozen_string_literal: true

module Parser
  # The object of this class will represents a single line
  class Line
    attr_accessor :index, :ip, :path, :common_path

    def initialize(data:, index:)
      @index = index
      @data = data
      parse_data
    end

    def valid?
      path.match(PATH_REGEX)
    end

    protected

    def parse_data
      splitted = @data.split(' ')
      @path, @ip = splitted
      @common_path = @path.split('/')[1] if valid?
    end
  end
end
