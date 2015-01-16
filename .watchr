# --------------------------------------------------
# Helpers
# --------------------------------------------------
def yard
  puts "Updating yardocs... "; STDOUT.flush
  system "bundle exec rake yard"
  puts "done\n"
end

def run_all_specs
  puts "Running all specs"
  system "bundle exec rspec"
end

def run_single_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  system "bundle exec rspec #{file}"
  puts
end

watch("spec/spec_helper.rb") do |match|
  run_all_specs
end

watch("spec/.*/*_spec.rb") do |match|
  run_single_spec match[0]
end

watch("lib/(.*/.*).rb") do |match|
  puts match.inspect
  run_single_spec %{spec/#{match[1]}_spec.rb}
end

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  if run_all_specs == true
    yard
  end
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }

puts "\nWatching.."
puts "==> Press Ctrl+\\ for running all tests and doc creation.\n"