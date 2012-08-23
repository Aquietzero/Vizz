# Data Types
------------

The most important part of a data visualization library is to deal with the data being passed. Some supported data forms will be listed below:


## Data in Array

Array is a popular container for data. The following discusion is based on the dimension of an array. For simplicity, several assumptions are made first.

+ The basic data are all numbers.
+ The graph is chosen as histogram.


### Data in 1d Array

#### Numbers

The data in 1d array can be organized as follows:

    [ d1, d2, d3, ... , dn ]

Since `dn`s are all numbers, when being visualized, data reflect the heights of the bars in the histogram.With 1d array data, there are many interesting tricks to visualize them. For those data which are organized in one dimension, the postions of them can be maped on any kinds of curves. When the data passed, the rendering process is described as follows:

1. Get data and configuration.
2. Get curve from configuration.
3. Calculate the position of each bar according to the domain of the data and the curve.
4. Iterate each data.
5. Apply the rendering configuration to render them.

One thing that deserves consideration is that the distances between any two data are the same. Because each piece of data corresponds to an index, which are of equivelant distances. **If the given data do not distribute universally, then some of the element of the data array should be declaired as a NULL specifically.**
