#!/usr/bin/env ruby

require_relative '../lib/s3j2'

text =
  File
    .readlines(File.join(File.dirname(__FILE__), '../data/corpus.txt'))
    .join(' ')
    .gsub("\n", '')

dictionnary =
  S3J2::WordCounter.file_to_dict(
    File.join(File.dirname(__FILE__), '../data/swear_words.txt')
  )

pp S3J2::WordCounter.word_counter(text, dictionnary)
