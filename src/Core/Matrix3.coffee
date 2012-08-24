# Matrix3.js defines the 3x3 matrix.
#
# @author zero / zhaoyunhaosss@gmail.com

# The matrix is construted as below:
#
#  | ma11 ma12 ma13 | 
#  | ma21 ma22 ma23 |
#  | ma31 ma32 ma33 |
#
# The storage is shown as below:
#
#  | element[0]   element[1]   element[2] |
#  | element[3]   element[4]   element[5] |
#  | element[6]   element[7]   element[9] |

class Matrix3

  constructor: (a11, a12, a13, a21, a22, a23, a31, a32, a33) ->
    @elements = new Float32Array(9)

    @set(
      a11, a12, a13,
      a21, a22, a23,
      a31, a32, a33
    )

  $: (i, j) ->
     @elements[i*3 + j]

  $$: (i, j, e) ->
    @elements[i*3 + j] = e

  set: (a11, a12, a13, a21, a22, a23, a31, a32, a33) ->
    @elements = [
      a11, a12, a13,
      a21, a22, a23,
      a31, a32, a33,
    ]

  setOrientation: (q) ->
    w = q.w
    x = q.x
    y = q.y
    z = q.z

    xw = x*w*2
    xy = x*y*2
    xz = x*z*2
    yw = y*w*2
    yz = y*z*2
    zw = z*w*2
    xx = x*x*2
    yy = y*y*2
    zz = z*z*2

    @element = [
      1-yy-zz,   xy+zw,   xz-yw,
        xy-zw, 1-xx-zz,   yz+xw,
        xz+yw,   yz-xw, 1-xx-yy,
    ]

  identity: ->
    @set(
      1, 0, 0,
      0, 1, 0,
      0, 0, 1
    )

  add: (m) ->
    ma = @elements
    mb = m.elements

    new Matrix3(
      ma[0] + mb[0], ma[1] + mb[1], ma[2] + mb[2],
      ma[3] + mb[3], ma[4] + mb[4], ma[5] + mb[5],
      ma[6] + mb[6], ma[7] + mb[7], ma[8] + mb[8]
    )

  addMatrix: (m) ->
    @elements[i] += m.elements[i] for i in [0...9]

  mulScalar: (s) ->
    m = @elements
    new Matrix3(
      m[0] * s, m[1] * s, m[2] * s,
      m[3] * s, m[4] * s, m[5] * s,
      m[6] * s, m[7] * s, m[8] * s
    )

  mulMatrix: (m) ->
    ma = @elements
    mb = m.elements

    new Matrix3(
      ma[0]*mb[0] + ma[1]*mb[3] + ma[2]*mb[6],
      ma[0]*mb[1] + ma[1]*mb[4] + ma[2]*mb[7],
      ma[0]*mb[2] + ma[1]*mb[5] + ma[2]*mb[8],

      ma[3]*mb[0] + ma[4]*mb[3] + ma[5]*mb[6],
      ma[3]*mb[1] + ma[4]*mb[4] + ma[5]*mb[7],
      ma[3]*mb[2] + ma[4]*mb[5] + ma[5]*mb[8],

      ma[6]*mb[0] + ma[7]*mb[3] + ma[8]*mb[6],
      ma[6]*mb[1] + ma[7]*mb[4] + ma[8]*mb[7],
      ma[6]*mb[2] + ma[7]*mb[5] + ma[8]*mb[8]
    )

  mulVector3: (v) ->
    new Vector3(
      v.x*@elements[0] + v.y*@elements[1] + v.z*@elements[2],
      v.x*@elements[3] + v.y*@elements[4] + v.z*@elements[5],
      v.x*@elements[6] + v.y*@elements[7] + v.z*@elements[8]
    )

  determinant: ->
    m = @elements

    m[0]*m[4]*m[8] + m[3]*m[7]*m[2] + m[6]*m[1]*m[5] -
    m[0]*m[7]*m[5] - m[6]*m[4]*m[2] - m[3]*m[1]*m[8]

  transpose: ->
    es = @elements
    new Matrix3(
      es[0], es[3], es[6],
      es[1], es[4], es[7],
      es[2], es[5], es[8]
    )

  transposeSelf: ->
    es = @elements

    tmp   = es[1]
    es[1] = es[3]
    es[3] = tmp

    tmp   = es[2]
    es[2] = es[6]
    es[6] = tmp

    tmp   = es[5]
    es[5] = es[7]
    es[7] = tmp

    @

  inverse: ->
    m = @elements
    det = @determinant()

    return if det is 0

    new Matrix3(
      m[4]*m[8] - m[5]*m[7], m[2]*m[7] - m[1]*m[8], m[1]*m[5] - m[2]*m[4],
      m[5]*m[6] - m[3]*m[8], m[0]*m[8] - m[2]*m[6], m[2]*m[3] - m[0]*m[5],
      m[3]*m[7] - m[4]*m[6], m[1]*m[6] - m[0]*m[7], m[0]*m[4] - m[1]*m[3]
    ).mulScalar(1/det)
 
  abs: ->
    e = Math.abs(e) for e in @elements when e < 0

  setFromAxisAngle: (axis, angle) ->
    x = axis.x
    y = axis.y
    z = axis.z
    c = Math.cos(angle)
    s = Math.sin(angle)
    t = 1 - c

    xy = x*y
    xz = x*z
    yz = y*z

    @set(
      x*x*t + c,  xy*t - z*s, xz*t + y*s,
      xy*t + z*s, y*y*t + c,  yz*t - x*s,
      xz*t - y*s, yz*t + x*s, z*z*t + c
    )

  log: ->
    es = @elements

    console.log(
      es[0] + '\t' + es[1] + '\t' + es[2] + '\n' +
      es[3] + '\t' + es[4] + '\t' + es[5] + '\n' +
      es[6] + '\t' + es[7] + '\t' + es[8] + '\n'
    )


@Vizz.Core.Matrix3 = Matrix3
