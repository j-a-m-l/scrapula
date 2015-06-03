guard :bundler do
  watch 'Gemfile'
end

guard :rspec, cmd: 'rspec --format progress --color -r ./spec/spec_helper.rb', all_on_start: true, all_after_pass: true do

  watch 'spec/spec_helper.rb'

  watch(%r{^lib/(.+)\.rb$}) {|m| "spec/lib/#{m[1]}_spec.rb"}
  watch(%r{^spec/.+_spec\.rb$})

end
