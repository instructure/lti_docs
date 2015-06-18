require "rubygems"

desc "Setup the Project"
task :setup do
  puts "## Seting up the project"

  system "bower"
end

desc "Deploy to Github Pages"
task :deploy do
  puts "## Deploying to Github Pages"

  puts "## Generating site"
  system "grunt build"

  cd "_site" do
    system "git add -A"

    message = "Site updated at #{Time.now.utc}"
    puts "## Commiting: #{message}"
    system "git commit -m \"#{message}\""

    puts "## Pushing generated site"
    system "git push"

    puts "## Deploy Complete!"
  end
end