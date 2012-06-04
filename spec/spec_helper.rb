$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'amida'

require 'stringio'
def capture(stream)
  begin
    stream = stream.to_s
    result = StringIO.new
    eval "$#{stream} = result"
    yield
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end
  result.string
end

def to_dev_null
  begin
    orig_stderr = $stderr.clone
    orig_stdout = $stdout.clone
    $stderr.reopen File.new('/dev/null', 'w')
    $stdout.reopen File.new('/dev/null', 'w')
    yield if block_given?
  ensure
    $stdout.reopen orig_stdout
    $stderr.reopen orig_stderr
  end
end

RSpec.configure do |config|
end
