
# Generator.coffee defines some random data generators.
#
# @author zero / zhaoyunhaosss@gmail.com

Random = @Vizz.Utils.Random

@Vizz.Utils.Generator =

  # Generate an array of size n with all its elements in range
  # [0, vibration]
  randomArray: (n, vibration) ->
    arr = Random.range(0, vibration) for x in [0...n]


  # Generate a grid, namely a 2D array, of size x_range and
  # z_range with all its elements in range [0, vibration]
  randomGrid: (x_range, z_range, vibration) ->
    grid = for x in [0...x_range]
      for z in [0...z_range]
        Random.range(0, vibration)
