
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
    return @end - @begin

  contain: (i) ->
    return @begin <= i <= @end


@Range = Range
