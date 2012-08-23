
# Random.coffee defines some methods to generate random numbers.
#
# @author zero / zhaoyunhaosss@gmail.com

Random =

  range: (begin, end) ->
    return begin + (end - begin) * Math.random()


@Random = Random
