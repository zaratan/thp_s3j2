#!/usr/bin/env ruby

require_relative '../lib/s3j2'

text =
  File
    .readlines(File.join(File.dirname(__FILE__), '../data/corpus.txt'))
    .join(' ')
    .gsub("\n", '')

dictionnary = %w[
  the
  of
  and
  to
  a
  in
  for
  is
  on
  that
  by
  this
  with
  i
  you
  it
  not
  or
  be
  are
]

pp S3J2::WordCounter.word_counter(text, dictionnary)
