require "bundler/gem_tasks"

def exec_test format=:progress, mode=:normal
  system "turn --#{format} --#{mode} -Ispec ./spec/**/*_spec.rb" 
end

task :default => :test

desc 'Run the test suite in progress mode'
task :test do
  exec_test
end

namespace :test do

  %w( progress outline dotted cue ).each do |format|
    desc "Turn format: #{format}"
    task format do
      exec_test format 
    end

    %w( solo cross ).each do |mode|
      namespace format do
        desc "Turn format: #{format} mode: #{mode}"
        task mode do
          exec_test format, mode
        end
      end
    end
  end

end


