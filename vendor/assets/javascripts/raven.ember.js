/**
 * Ember.js plugin
 *
 * Patches event handler callbacks and ajax callbacks.
 */
;(function(window, Raven, Ember) {
  'use strict';

  // quit if Ember isn't on the page
  if (!Ember) {
      return;
  }

  var _oldOnError = Ember.onerror;

  Raven.onBandangoError = function EmberOnError(error) {
      Raven.captureException(error);
      if (typeof _oldOnError === 'function') {
          _oldOnError.call(this, error);
      }
  };

  // Trap exceptions from within Ember run loop
  Ember.onerror = Raven.onBandangoError;

  // Trap unhandled RSVP promise failures
  Ember.RSVP.configure('onerror', Raven.onBandangoError);

  // Safety net to report any untrapped exceptions on browsers
  // that respect window.onerror.  Currently, failures from within
  // Backburner callbacks will end up here. This is inferior to the
  // other handlers because the stack trace is missing by the
  // time the exception gets here.
  window.onerror = Raven.onBandangoError;

}(this, Raven, window.Ember));
