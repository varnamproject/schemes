#!/usr/bin/env ruby

# encoding: utf-8

require_relative '../varnam'

$handles = {}
def get_varnam_handle(scheme_id)
  return $handles[scheme_id] if $handles[scheme_id]

  if find_govarnam.nil?
    puts "Can't find govarnam shared library."
    exit 1
  end

  scheme_path = ENV['TEST_SCHEME_PATH'] ||
      "#{__dir__}/../schemes/#{scheme_id}"

  learnings_file = Tempfile.new('learnings_file')
  $handles[scheme_id] = VarnamInstance.new(
    "#{scheme_path}/#{scheme_id}.vst",
    learnings_file.path
  )

  $handles[scheme_id]
end

require "minitest/autorun"
require_relative './ml'
require_relative './hi'
require_relative './ne'
