
# Random.coffee defines some methods to generate random numbers.
#
# @author zero / zhaoyunhaosss@gmail.com

@Vizz.Utils.Random =

  range: (begin, end) ->
    begin + (end - begin) * Math.random()
