/* Hide the interactive figure if its script never started (blocked, failed to load, or threw).
   rosa-widgets.js sets data-ready="1" on #ctrl-widget after a successful start. */
window.addEventListener('load', function () {
  try {
    var root = document.getElementById('ctrl-widget');
    if (!root || root.dataset.ready !== '1') document.documentElement.classList.add('widget-failed');
  } catch (e) { document.documentElement.classList.add('widget-failed'); }
});
