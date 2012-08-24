
# Range.coffee defines a basic util class Range.
#
# @author zero / zhaoyunhaosss@gmail.com

class Range

  constructor: (begin, end) ->

    if begin <= end
      @begin = begin
      @end = end
    else
      @begin = end
      @end = begin


  length: ->
    @end - @begin

  contain: (i) ->
    @begin <= i <= @end


@Vizz.Core.Range = Range
