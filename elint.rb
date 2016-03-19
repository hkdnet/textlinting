#!/usr/bin/env ruby
require 'fileutils'
dir = `ghq list -p -e hkdnet/textlinting`.chomp
ARGV.each do |f|
  FileUtils.cp(f, "#{dir}/target.md")
  FileUtils.cd(dir) do
    puts `$(npm bin)/textlint target.md`
    puts `$(npm bin)/textlint --fix target.md`
  end
  FileUtils.cp("#{dir}/target.md", f)
end
