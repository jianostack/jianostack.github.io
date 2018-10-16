/*
 * Random
 * https://stackoverflow.com/questions/1349404/generate-random-string-characters-in-javascript#
 */
Math.random().toString(36).substring(7);
new Date().valueOf();


/*
 * Just toggle 
 *
 */
$(this).find('.row').toggle( "slow", function() {
  // Animation complete.
});

/*
 * Height toggle
 *
 */
$(this).find('.hiddendept').slideToggle( "fast", function() {
  //animation complete
});

/*
 * animate anchors
 * http://stackoverflow.com/questions/7717527/smooth-scrolling-when-clicking-an-anchor-link
 */
$('a').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
    return false;
});

/*
 * add attribute to element
 * 
 */
$('#news a').attr('target','_blank');

/*
 * Simple mobile detect
 * 
 */
function isMobile() {
    if (navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/Windows Phone/i)) {
        return true;
    } else {
        return false;
    }
}


/*
 * Back
 * 
 */
<a href="javascript:history.back()">Back</a>
<a href="javascript:history.go(-1)">Back</a>

/*
 * Redirect
 * 
 */
window.location = "/our-work/supermodel-me-case-study"

/*
 * Reload
 * 
 */
window.location.reload()

/*
 * Replace
 * 
 */
$(".btnThailand").click(function(){
  var translate=window.location.href;
  translate=translate.replace("index.html","index_th.html");
  window.location = translate;
});

/*
 * Split
 * 
 */
var strip_name;
var new_name;

strip_name = jQuery("span.actual").text();
new_name = strip_name.split(' ')[0]+" "+strip_name.split(' ')[1];
jQuery("span.actual").replaceWith(new_name);

/*
 * Animate fade
 * 
 */
$('a[href="#yes"]').click(function(){
  $('.hidden').animate({opacity: 'toggle'}, 500, function() {
      // Animation complete.
    });
})

/*
 * Finished loading window
 * self executing function
 *
 */
window.addEventListener('load', function() {
  
})

/*
 * This Function is called when the DOM is ready.
 * self executing function
 *
 */
$(document).ready( function() {
});

// Shorthand
(function($) {
});
// Shorthand
jQuery(function(){
});

/*
 * Wordpress jQuery
 * self executing function
 * codex.wordpress.org
 *
 */
jQuery(document).ready(function($) {
    // $() will work as an alias for jQuery() inside of this function
});
