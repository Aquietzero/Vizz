
# Scaler

## Importance of Scaler

Scaler plays an important role in rendering mainly for two reasons:

+ Data have their own domains, ranges. If it is rendered purely depend on their original ranges, then the outcome will definitely not good. For example, if the origin range of data is [-1, 1], then render them onto a 500x500 scene shows nothing. Scaler takes the responsibility to keep the balance between the ranges of data and the scene and make some adjustments.

+ After rendering the data onto the scene, the user may want to amplify a certain part of the data. This requires the flexibility to change the focus area of the data.


## Workflow

The scaler is similar to a coordinate mapping function. The input and output are all collections of positions. Scaler is categorized into 1 dimension, 2 dimension and 3 dimension. The workflow will be described below accordingly with the corresponding category of scaler.


### 1D Version

The process is quite simple. Given the local coordinate range `local_range` and the world coordinate range `world_range`, the procedure is as follows:

1. Get the center of both ranges.
2. Originify the local_range.
3. Calculate the scaler factor by `half length of local_range / half length of world_range`.
4. Scale the positions in local_range.
5. Translate the local_range to the world_range according to the centers of both ranges.


### 2D Version and 3D Version

Actually, the 2D version and 3D version have a similar workflow. The only difference is that the computation has more than one dimension.
