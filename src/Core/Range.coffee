
# Range.coffee defines some basic ranges.
#
# @author zero / zhaoyunhaosss@gmail.com

# Range is the representation of the interval concept
# in mathematics.
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

  center: ->
    (@begin + @end) / 2

  half: ->
    @end - @center()


# Rect defines a retangle area, which is in two dimension.
# It is mostly used in space partition.
class Rect

  constructor: (range1, range2) ->
    @x = range1
    @z = range2

  contain: (p) ->
    @x.contain(p.x) and @z.contain(p.z)

  center: ->
    x: (range1.begin + range2.begin) / 2
    z: (range1.end   + range2.end  ) / 2

  half: ->
    x: @x.end - @center.x
    z: @z.end - @center.z


@Vizz.Core.Range = Range
@Vizz.Core.Rect  = Rect
