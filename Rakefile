task :check_repo do
  current_branch = `git rev-parse --abbrev-ref HEAD`.strip
  any_changes = `git status -s | wc -l`.strip.to_i
  abort "Repo is not clean, commit your changes first..." unless any_changes == 0
end

AVAILABLE_REVISIONS = ["major", "minor", "patch"]

desc "Bump version, default: patch"
task :bump, [:revision] => [:check_repo] do |_, args|
  args.with_defaults(revision: "patch")
  abort "Please provide valid revision: #{AVAILABLE_REVISIONS.join(',')}" unless AVAILABLE_REVISIONS.include?(args.revision)
  system "bumpversion #{args.revision}"
end
