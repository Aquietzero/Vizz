# EventHandler is for better event organization of each
# primitives. There are so many types of events and each
# type of event has many predefined or personal defined
# features.

class EventHandler

  # The subject of a event handler is actually the action
  # receiver, like the primitives in the graph.
  constructor: (@subject) ->

  # bind should make sure that all the events are binded
  # to the subject of the event handler.
  bind: (event, attrs) =>
    @subject[event] = ((attrs) =>
      return =>
        @subject['set' + attr]? val for attr, val of attrs
    )(attrs)

  # The subject is currently triggered by some event.
  triggered: (event) ->
    @subject[event]?()


@Vizz.EventHandler.EventHandler = EventHandler
