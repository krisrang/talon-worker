require "shellwords"

class NoShellEscape < String
  def shellescape
    self
  end
end

module ShellHelpers
  def run(command, options = {})
    %x{ #{command_options_to_string(command, options)} }
  end

  def run_stdout(command, options = {})
    options[:out] ||= '2>/dev/null'
    run(command, options)
  end

  def command_options_to_string(command, options)
    options[:out] ||= "2>&1"
    "bash -c #{command.shellescape} #{options[:out]} "
  end

  def noshellescape(string)
    NoShellEscape.new(string)
  end
end
