(function(undefined) {
  'use strict';

  var Dispatcher = (function() {
    var Dispatcher = function() {
      this.routes = {};
    };

    Dispatcher.prototype.initialize = function() {
      var html = document.querySelector('html'),
          action = html.dataset.action,
          controller = html.dataset.controller;

        this.dispatch('application', 'initialize');
        this.dispatch('application', action);
        this.dispatch(controller, 'initialize');
        this.dispatch(controller, action);
    };

    Dispatcher.prototype.route = function() {
      var amalgams = Array.prototype.slice.call(arguments),
          fn = amalgams.pop();
          
      amalgams.forEach(function(amalgam) {
        var split = amalgam.split('#'),
            controller = split[0],
            action = split[1];

        this.routes[controller] = this.routes[controller] || { };
        this.routes[controller][action] = this.routes[controller][action] || [ ];
        this.routes[controller][action].push(fn);
      }.bind(this));
    };

    Dispatcher.prototype.dispatch = function(controller, action, xhr, options) {
      if (this.routes[controller] && this.routes[controller][action]) {
        this.routes[controller][action].forEach(function(fn) {
          fn(controller, action, xhr, options);
        });
      }
    };

    return Dispatcher;
  })();

  var dispatcher = new Dispatcher,
      state = { },
      previousStates = [ ];

  var pageChanged = function(controller, action, xhr, options) {
    var html = document.querySelector('html')
        options = options || { };

    html.dataset.action = action;
    html.dataset.controller = controller;

    dispatcher.dispatch('application', 'initialize', xhr, options);
    dispatcher.dispatch('application', action, xhr, options);
    dispatcher.dispatch(controller, 'initialize', xhr, options);
    dispatcher.dispatch(controller, action, xhr, options);

    if (!options.back) {
      previousStates.push({
        action: state.action,
        controller: state.controller
      });
    }

    state.action = action;
    state.controller = controller;
  };

  document.addEventListener('DOMContentLoaded', function() {
    var html = document.querySelector('html');

    state = {
      action: html.dataset.action,
      controller: html.dataset.controller
    };

    return dispatcher.initialize();
  });

  document.addEventListener('page:load', function(e) {
    var xhr = e.data,
        action = xhr.getResponseHeader('X-Action'),
        controller = xhr.getResponseHeader('X-Controller');

    pageChanged(controller, action, xhr);
  });

  window.addEventListener('popstate', function(e) {
    if (e.turbolinks) {
      var state = previousStates.pop(); // local variable!

      if (state && state.controller && state.action) {
        pageChanged(state.controller, state.action, null, { back: true });
      }
    }
  });

  // exports
  this.route = dispatcher.route.bind(dispatcher);

  return true;
}).call(this);
