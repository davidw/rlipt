#!/usr/bin/env ruby

# Grep a Rails log file for an IP address, and return all lines
# associated with those requests.
#
# David N. Welton <davidw@dedasys.com>

ipaddr = ARGV[0]
filename = ARGV[1]

matching = []

File.foreach(filename) do |line|
  if line.match("for #{ipaddr}")
    matching << line
  end
end

uuids = {}

UUIDRE = /^\[(.+?)\]/

matching.map do |l|
  # Matches [23d41e8c43a8aed2ec89cfe55654c75b] at beginning of line.
  m = l.match(UUIDRE)
  if m
    uuids[m[1]] = true
  end
end

File.foreach(filename) do |line|
  m = line.match(UUIDRE)
  if m && uuids[m[1]]
    puts line
  end
end
