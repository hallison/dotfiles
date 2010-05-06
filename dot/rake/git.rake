namespace "git" do
  desc "Push commits to all branches"
  task "push-all" do
    `git branch`
  end
end

