$(document).ready(function() {
  scheduler.config.xml_date="%Y-%m-%d %H:%i";
  scheduler.config.start_on_monday = false;
  scheduler.config.show_loading = true;
  /*
  scheduler.config.collision_limit = 1
  scheduler.attachEvent("onEventCollision", function (ev, evs){
    console.log(ev);
    console.log(evs);
    alert('Sorry you already have an event with in that timeslot');
    return false;
  });
  */
  scheduler.init('scheduler_here',new Date(),"month");
  scheduler.load("/events.json", 'json');
  var dp = new dataProcessor("/events/save");
  dp.init(scheduler);
  dp.setTransactionMode("POST",false);
});
