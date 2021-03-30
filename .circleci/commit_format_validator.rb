# encoding: UTF-8

class Commit
  BASE_BRANCH = "origin/develop"

  class << self
    def valid?(message)
      message.strip!
      return true if message.nil? || message.empty?
      return true if message.match?(/^[Rr]evert.*/)

      # Accepted format:
      #  - refs #123
      message.match?(/\A(refs)\s(#\d+).+\z/)
    end

    def all_valid?
      commits = `git log --format="%s" --no-merges #{BASE_BRANCH}..`.strip.split("\n")
      return true if commits.empty?

      commits.all? { |commit| valid?(commit) }
    end
  end
end

if Commit.all_valid?
  puts "Commit's message is good!"
  exit(0)
else
  puts "Commit's message format is incorrect. Please check again!"
  puts "Correct format: refs #[id of redmine ticket] detail message"
  puts "Example:"
  puts "- refs #123 message"
  exit(1)
end
