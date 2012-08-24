
# Scaler.coffee is used to adjust the function coordinate to
# the world coordinate.
#
# @author zero / zhaoyunhaosss@gmail.com

@Vizz.Core.Scaler =

  getScaler: (type) ->
    switch type
      when 'CARTESIAN' then @_1d
      when 'POLAR'     then @_1d
      else @_1d

  # Scaler for 1D ranges.
  _1d: (positions, local_range, world_range) ->
    # Calculate the center of each range in their coordinate systems.
    local_center = local_range.center()
    world_center = world_range.center()

    # Originify basiclly translates the whole range to an
    # origin-symmatrical position.
    p.x -= local_center for p in positions

    # Calculate the offset of positions in local coordinate system.
    factor = world_range.half() / local_range.half()

    # Calculate the translate delta.
    offset = world_center - local_center

    for p in positions
      p.x = (p.x - offset) * factor
      p.z = p.z*factor

  # Scaler for 2D rects.
  _2d: (positions, local_rect, world_rect) ->
    # Calculate the center of each range in their coordinate systems.
    local_center = local_rect.center()
    world_center = world_rect.center()

    # Originify basiclly translates the whole range to an
    # origin-symmatrical position.
    p.x -= local_center.x for p in positions
    p.z -= local_center.z for p in positions

    # Calculate the offset of positions in local coordinate system.
    factor_x = world_range.half().x / local_range.half().x
    factor_z = world_range.half().z / local_range.half().z

    # Calculate the translate delta.
    offset_x = world_center.x - local_center.x
    offset_z = world_center.z - local_center.z

    for p in positions
      p.x = (p.x - offset_x) * factor_x
      p.z = (p.z - offset_z) * factor_z

