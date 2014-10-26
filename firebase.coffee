util = require 'util'
routes = require './routes'

Firebase = require 'firebase'
runnersRef = new Firebase 'https://boxrunner.firebaseio.com/runners'

runners = []

movePosition = (runners) ->
  for key of runners
    runner = runners[key]
    #console.log 
    # get the route for this rider
    # get the steps for this route, and increment the rider's coordinates
    steps = routes[runner.route_id].steps
    # set the current lat lng to the next in the steps
    # util.puts JSON.stringify steps
    unless runner.lat and runner.lng
      console.log runner.name, "has no position on this route"
      # then set his position to the start_point of the first step
      runnersRef.child(key).update
        lat: steps[0].start_location.lat
        lng: steps[0].start_location.lng
        step_index: 0
        direction: 'forward'
    else
      i = runner.step_index
      if i < steps.length - 1
        i++
        console.log runner.name, "'s position should move forward"
        runnersRef.child(key).update
          lat: steps[i].start_location.lat
          lng: steps[i].start_location.lng
          step_index: i
          direction: 'forward'
      else
        i--
        console.log runner.name, "'s position should move backward"
        runnersRef.child(key).update
          lat: steps[i].start_location.lat
          lng: steps[i].start_location.lng
          step_index: i
          direction: 'backward'

runnersRef.once 'value', (snapshots) ->
  runners = snapshots.val()
  movePosition runners
, (errorObject) ->
  console.log 'The read failed: ', errorObject.code

setInterval ->
  movePosition(runners)
, 10000