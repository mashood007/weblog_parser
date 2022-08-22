# frozen_string_literal: true

module Parser
  PATH_REGEX = %r{^(\.\./(?:\.\./)*)?(?!.*?//)(?!(?:.*/)?\.+(?:/|$)).+$}.freeze
  autoload :Base, 'parser/base.rb'
  autoload :File, 'parser/file.rb'
  autoload :WebServer, 'parser/web_server.rb'
  autoload :Line, 'parser/line.rb'
end
