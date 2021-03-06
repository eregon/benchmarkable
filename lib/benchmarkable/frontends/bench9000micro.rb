# Copyright (c) 2016 Oracle and/or its affiliates. All rights reserved. This
# code is released under a tri EPL/GPL/LGPL license. You can use it,
# redistribute it and/or modify it under the terms of the:
#
# Eclipse Public License version 1.0
# GNU General Public License version 2
# GNU Lesser General Public License version 2.1

input = micro_harness_input

SMALL_PRIME = 149

def harness_sample(input)
  sum = 0
  micro_harness_iterations.times do
    sum = (sum + micro_harness_sample(input)) % SMALL_PRIME
  end
  sum
end

if harness_sample(input) != micro_harness_expected
  abort 'result was incorrect'
end

Object.instance_eval do
  alias_method :true_micro_harness_sample, :micro_harness_sample
end

benchmarkable do
  true_micro_harness_sample input
end
