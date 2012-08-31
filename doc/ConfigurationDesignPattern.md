# Configuration Design Pattern

The goal of the design can be directly shown as below:

    Obj:
      attr1
      attr2
      :
    
      event1
      event2
      :
    
    ObjCollection：
      [Objs...]
      [other components...]
    
      organize_Objs_In_Way1_With(method)
      organize_Objs_In_Way1_With(method)
      :
    
    
    myCollection = new ObjCollection({
      // basic configuration...
    });
    
    // extend configuration
    myCollection
      .addComponent(c1)
      .addComponent(c2)
      .addEvent(e1)
      .addEvent(e2)

First of all, I will just call the representation of a piece of datum a primitive of the graph. Graph can be regarded as the collection of primitives and some more optional components such as the coordinates and texts. So basically, the configurable objects can be listed as below:

+ The appearance of primitives.
+ The behavior of the primitives.
+ The way to organize all the primitives in a graph.
