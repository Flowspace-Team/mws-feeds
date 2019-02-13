group :red_green_refactor_rb, halt_on_fail: true do
  rspec_options = {
    all_on_start: false,
    failed_mode: :keep,
  }
  rspec_format = "--format documentation"

  rspec_options[:cmd] = "bundle exec rspec #{rspec_format}"

  guard 'rspec', rspec_options do
    watch(%r{spec/spec_helper.rb}) { "spec" }
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  end

  rubocop_options = {
    cli: %w[-D --format fuubar],
    all_on_start: false,
    keep_failed: false,
    notification: :failed,
  }

  guard :rubocop, rubocop_options do
    watch('Guardfile')
    watch('Rakefile')
    watch(/.+\.rb$/)
    watch(/.+\.rake$/)
    # Rerun rubocop on everything in the folder or below a .rubocop.yml file
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end
end
