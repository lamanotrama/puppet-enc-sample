#!/usr/bin/env ruby

require 'yaml'

certname = ARGV[0]
role = certname.match(/^([a-z-]+)/)[0]

puts YAML.dump({
  'classes' => ['base', role],
})

