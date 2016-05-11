# Copyright (c) 2016 Oracle and/or its affiliates. All rights reserved. This
# code is released under a tri EPL/GPL/LGPL license. You can use it,
# redistribute it and/or modify it under the terms of the:
#
# Eclipse Public License version 1.0
# GNU General Public License version 2
# GNU Lesser General Public License version 2.1

input = harness_input

unless harness_verify(harness_sample(input))
  abort 'result was incorrect'
end

Object.instance_eval do
  alias_method :true_harness_sample, :harness_sample
end

benchmarkable do
  true_harness_sample input
end