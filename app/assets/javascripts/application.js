// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

window.taskBoard = window.taskBoard || {}

taskBoard.initPomodoroControls = function()
{
  taskBoard.pomodoroTimerElement = $("#pomodoro-timer");

  $("#pomodoro-button").click(function(){
    if (taskBoard.pomodoroTimerElement.attr("status") == "stop")
      taskBoard.startPomodoro();
    else
      taskBoard.stopPomodoro();
  });
}

taskBoard.startPomodoro = function()
{
  taskBoard.pomodoroTimerElement.html("25:00");
  taskBoard.pomodoroTimerElement.attr("status", "start");

  setTimeout(function(){ 
    taskBoard.pomodoroLoop(); }, 1000);

  $("#pomodoro-button").html("Stop");
}

taskBoard.stopPomodoro = function()
{
  taskBoard.pomodoroTimerElement.attr("status", "stop");
  $("#pomodoro-button").html("Start");
}

taskBoard.pomodoroLoop = function()
{
  var htmlDisplay = taskBoard.pomodoroTimerElement.html();
  var statusElement = taskBoard.pomodoroTimerElement.attr("status");
  
  var time = htmlDisplay.split(":");
  var minutes = time[0];
  var seconds = time[1];

  seconds--;

  if (seconds < 0)
  {
    seconds = 59;
    minutes--;
  }
  
  if ((minutes > 0 || seconds > 0) && statusElement == "start")
  {
    taskBoard.pomodoroTimerElement.html(minutes + ":" + seconds);

    setTimeout(function(){ 
    taskBoard.pomodoroLoop(); }, 1000);
  }
  else
  {
    taskBoard.pomodoroTimerElement.html(minutes + ":" + seconds);
  }
}