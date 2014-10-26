Firebase = require 'firebase'

#routesRef = new Firebase 'https://boxrunner.firebaseio.com/routes'
runnersRef = new Firebase 'https://boxrunner.firebaseio.com/runners'

runners = [
 {
   "name":"Sola",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaLnxj4sGvf9PIL"
  },
  {
   "name":"Yemi",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaSR0kqE3qfB3As"
  },
  {
   "name":"Akin",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaX-bEllH1Nx4T2"
  },
  {
   "name":"Dipo",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhabJHMNpDngJVwx"
  },
  {
   "name":"Muyiwa",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LharmhYeCu6PNaHt"
  },
  {
   "name":"Ojo",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaihAAZ0G3dLWZB"
  },
  {
   "name":"Tope",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhagnEF7_pCkRU0V"
  },
  {
   "name":"Kenny",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9Lham-QOuSn-AxKIr"
  },
  {
   "name":"Dayo",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LharmhYeCu6PNaHt"
  },
  {
   "name":"Sayo",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaLnxj4sGvf9PIL"
  },
  {
   "name":"Biodun",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaLnxj4sGvf9PIL"
  },
  {
   "name":"Segun",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LharmhYeCu6PNaHt"
  },
  {
   "name":"Yetty",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaSR0kqE3qfB3As"
  },
  {
   "name":"Bimbo",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhaSR0kqE3qfB3As"
  },
  {
   "name":"Damola",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhabJHMNpDngJVwx"
  },
  {
   "name":"Seun",
   "phone":"2348067794292",
   "lat":"",
   "lng":"",
   "on_duty":true,
   "busy":false,
   "route_id":"-J_9LhabJHMNpDngJVwx"
  }
]

runnersRef.push runner for runner in runners

console.log "Done persisting records"

###
#for route in routes
route = routes[7]
end = "#{route.end_location.lat}, #{route.end_location.lng}"
start = "#{route.start_location.lat}, #{route.start_location.lng}"
  
maps.directions start, end,
  (err, data) ->
    util.puts "\n"
    util.puts route.name
    #util.puts JSON.stringify [step.end_location, step.start_location] for step in data['routes'][0]['legs'][0]['steps']
    points = ({ end_location:step.end_location, start_location:step.start_location } for step in data['routes'][0]['legs'][0]['steps'])
    util.puts "points"
    util.puts JSON.stringify points
  , 
  false,
  'driving'

###