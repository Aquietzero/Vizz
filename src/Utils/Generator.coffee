
# Generator.coffee defines some random data generators.
#
# @author zero / zhaoyunhaosss@gmail.com

Generator =

  randomGrid: (x_range, z_range, vibration) ->
    grid = for x in [0...x_range]
      for z in [0...z_range]
        Vizz.Random.range(0, vibration)

    return grid


@Generator = Generator
