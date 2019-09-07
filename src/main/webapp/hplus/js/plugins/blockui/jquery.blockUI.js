/*
 * jQuery blockUI plugin
 * Version 2.08 (06/11/2008)
 * @requires jQuery v1.2.3 or later
 *
 * Examples at: http://malsup.com/jquery/block/
 * Copyright (c) 2007-2008 M. Alsup
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * 
 * Thanks to Amir-Hossein Sobhi for some excellent contributions!
 */

;(function($) {

if (/1\.(0|1|2)\.(0|1|2)/.test($.fn.jquery) || /^1.1/.test($.fn.jquery)) {
    alert('blockUI requires jQuery v1.2.3 or later!  You are using v' + $.fn.jquery);
    return;
}

// global $ methods for blocking/unblocking the entire page
$.blockUI   = function(opts) { install(window, opts); };
$.unblockUI = function(opts) { remove(window, opts); };

// plugin method for blocking element content
$.fn.block = function(opts) {
    return this.each(function() {
        if ($.css(this,'position') == 'static')
            this.style.position = 'relative';
        install(this, opts);
    });
};

// plugin method for unblocking element content
$.fn.unblock = function(opts) {
    return this.each(function() {
        remove(this, opts);
    });
};

$.blockUI.version = 2.08; // 2nd generation blocking at no extra cost!

// override these in your code to change the default behavior and style
$.blockUI.defaults = {
    // message displayed when blocking (use null for no message)
    message:  '<h1>Please wait...</h1>',
    
    // styles for the message when blocking; if you wish to disable
    // these and use an external stylesheet then do this in your code:
    // $.blockUI.defaults.css = {};
    css: { 
        padding:        0,
        margin:         0,
        width:          '30%', 
        top:            '40%', 
        left:           '35%', 
        textAlign:      'center', 
        color:          '#000', 
        border:         '3px solid #aaa',
        backgroundColor:'#fff',
        cursor:         'wait'
    },
    
    // styles for the overlay
    overlayCSS:  { 
        backgroundColor:'#000', 
        opacity:        '0.6' 
    },
    
    // z-index for the blocking overlay
    baseZ: 1000,
    
    // set these to true to have the message automatically centered
    centerX: true, // <-- only effects element blocking (page block controlled via css above)
    centerY: true,
    
    // allow body element to be stetched in ie6; this makes blocking look better
    // on "short" pages.  disable if you wish to prevent changes to the body height
    allowBodyStretch: true,
    
    // be default blockUI will supress tab navigation from leaving blocking content;
    constrainTabKey: true,
    
    // fadeOut time in millis; set to 0 to disable fadeout on unblock
    fadeOut:  400,
    
    // if true, focus will be placed in the first available input field when
    // page blocking
    focusInput: true,
    
    // suppresses the use of overlay styles on FF/Linux (due to performance issues with opacity)
    applyPlatformOpacityRules: true,
    
    // callback method invoked when unblocking has completed; the callback is
    // passed the element that has been unblocked (which is the window object for page
    // blocks) and the options that were passed to the unblock call:
    //     onUnblock(element, options)
    onUnblock: null
};

// private data and functions follow...

var ie6 = false;
var pageBlock = null;
var pageBlockEls = [];

function install(el, opts) {
    var full = (el == window);
    var msg = opts && opts.message !== undefined ? opts.message : undefined;
    opts = $.extend({}, $.blockUI.defaults, opts || {});
    opts.overlayCSS = $.extend({}, $.blockUI.defaults.overlayCSS, opts.overlayCSS || {});
    var css = $.extend({}, $.blockUI.defaults.css, opts.css || {});
    msg = msg === undefined ? opts.message : msg;

    // remove the current block (if there is one)
    if (full && pageBlock) 
        remove(window, {fadeOut:0}); 
    
    // if an existing element is being used as the blocking content then we capture
    // its current place in the DOM (and current display style) so we can restore
    // it when we unblock
    if (msg && typeof msg != 'string' && (msg.parentNode || msg.jquery)) {
        var node = msg.jquery ? msg[0] : msg;
        var data = {};
        $(el).data('blockUI.history', data);
        data.el = node;
        data.parent = node.parentNode;
        data.display = node.style.display;
        data.position = node.style.position;
        data.parent.removeChild(node);
    }
    
    var z = opts.baseZ;
    
    // blockUI uses 3 layers for blocking, for simplicity they are all used on every platform;
    // layer1 is the iframe layer which is used to supress bleed through of underlying content
    // layer2 is the overlay layer which has opacity and a wait cursor
    // layer3 is the message content that is displayed while blocking
    
    var lyr1 =  $('<iframe class="blockUI" style="z-index:'+ z++ +';border:none;margin:0;height:850px;width:100%;filter:alpha(opacity=0);padding:0;position:absolute;top:0;left:0" src="javascript:false;"></iframe>');
    var lyr2 = $('<div class="blockUI" style="z-index:'+ z++ +';filter:alpha(opacity=100);cursor:wait;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>');
    var lyr3 = full ? $('<div class="blockUI blockMsg blockPage" style="height:80px;z-index:'+z+';filter:alpha(opacity=100);position:fixed"><div style="padding-top:3px;padding-bottom: 12px;"><div class="sk-spinner sk-spinner-chasing-dots"><div class="sk-dot1"></div> <div class="sk-dot2"></div></div></div></ht></div>')
                    : $('<div class="blockUI blockMsg blockElement" style="height:80px;z-index:'+z+';display:none;position:absolute"></div>');

    // if we have a message, style it
    if (msg) 
        lyr3.css(css);

    // style the overlay
    if (!opts.applyPlatformOpacityRules || !(/Linux/.test(navigator.platform)))
        lyr2.css(opts.overlayCSS);
    lyr2.css('position', full ? 'fixed' : 'absolute');
    


    $([lyr1[0],lyr2[0],lyr3[0]]).appendTo(full ? 'body' : el);
    
    // ie7 must use absolute positioning in quirks mode and to account for activex issues (when scrolling)
    var expr = (!$.boxModel || $('object,embed', full ? null : el).length > 0);
    if (ie6 || expr) {
        // give body 100% height
        if (full && opts.allowBodyStretch && $.boxModel)
            $('html,body').css('height','100%');

        // fix ie6 issue when blocked element has a border width
        if ((ie6 || !$.boxModel) && !full) {
            var t = sz(el,'borderTopWidth'), l = sz(el,'borderLeftWidth');
            var fixT = t ? '(0 - '+t+')' : 0;
            var fixL = l ? '(0 - '+l+')' : 0;
        }

        // simulate fixed position
        $.each([lyr1,lyr2,lyr3], function(i,o) {
            var s = o[0].style;
            s.position = 'absolute';
            if (i < 2) {

                full ? s.height = document.body.scrollHeight > document.body.offsetHeight ? document.body.scrollHeight : document.body.offsetHeight + "px"
                     : s.height =  this.parentNode.offsetHeight + "px";
                full ? s.width = jQuery.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"
                     : s.width = this.parentNode.offsetWidth + "px";
                if (fixL) s.left = fixL;
                if (fixT) s.top =  fixT;
            }
            else if (opts.centerY) {
                if (full) s.top = (document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px";
                s.marginTop = 0;
            }
        });
    }
    
    // show the message
    lyr3.append(msg).show();
    if (msg && (msg.jquery || msg.nodeType))
        $(msg).show();

    // bind key and mouse events
    //bind(1, el, opts);
        
    if (full) {
        pageBlock = lyr3[0];
        pageBlockEls = $(':input:enabled:visible',pageBlock);
        if (opts.focusInput)
            setTimeout(focus, 20);
    }
    else
        center(lyr3[0], opts.centerX, opts.centerY);
};

// remove the block
function remove(el, opts) {
    var full = el == window;
    var data = $(el).data('blockUI.history');
    opts = $.extend({}, $.blockUI.defaults, opts || {});
    bind(0, el, opts); // unbind events
    var els = full ? $('body').children().filter('.blockUI') : $('.blockUI', el);
    
    if (full) 
        pageBlock = pageBlockEls = null;

    if (opts.fadeOut) {
        els.fadeOut(opts.fadeOut);
        setTimeout(function() { reset(els,data,opts,el); }, opts.fadeOut);
    }
    else
        reset(els, data, opts, el);
};

// move blocking element back into the DOM where it started
function reset(els,data,opts,el) {
    els.each(function(i,o) {
        // remove via DOM calls so we don't lose event handlers
        if (this.parentNode) 
            this.parentNode.removeChild(this);
    });
    if (data && data.el) {
        data.el.style.display = data.display;
        data.el.style.position = data.position;
        data.parent.appendChild(data.el);
        $(data.el).removeData('blockUI.history');
    }
    if (typeof opts.onUnblock == 'function')
        opts.onUnblock(el,opts);
};

// bind/unbind the handler
function bind(b, el, opts) {
    var full = el == window, $el = $(el);
    
    // don't bother unbinding if there is nothing to unbind
    if (!b && (full && !pageBlock || !full && !$el.data('blockUI.isBlocked'))) 
        return;
    if (!full) 
        $el.data('blockUI.isBlocked', b);
        
    // bind anchors and inputs for mouse and key events
    var events = 'mousedown mouseup keydown keypress click';
    b ? $(document).bind(events, opts, handler) : $(document).unbind(events, handler);

// former impl...
//    var $e = $('a,:input');
//    b ? $e.bind(events, opts, handler) : $e.unbind(events, handler);
};

// event handler to suppress keyboard/mouse events when blocking
function handler(e) {
    // allow tab navigation (conditionally)
    if (e.keyCode && e.keyCode == 9) {
        if (pageBlock && e.data.constrainTabKey) {
            var els = pageBlockEls;
            var fwd = !e.shiftKey && e.target == els[els.length-1];
            var back = e.shiftKey && e.target == els[0];
            if (fwd || back) {
                setTimeout(function(){focus(back)},10);
                return false;
            }
        }
    }
    // allow events within the message content
    if ($(e.target).parents('div.blockMsg').length > 0)
        return true;
        
    // allow events for content that is not being blocked
    return $(e.target).parents().children().filter('div.blockUI').length == 0;
};

function focus(back) {
    if (!pageBlockEls) 
        return;
    var e = pageBlockEls[back===true ? pageBlockEls.length-1 : 0];
    if (e) 
        e.focus();
};

function center(el, x, y) {
    var p = el.parentNode, s = el.style;
    var l = ((p.offsetWidth - el.offsetWidth)/2) - sz(p,'borderLeftWidth');
    var t = ((p.offsetHeight - el.offsetHeight)/2) - sz(p,'borderTopWidth');
    if (x) s.left = l > 0 ? (l+'px') : '0';
    if (y) s.top  = t > 0 ? (t+'px') : '0';
};

function sz(el, p) { 
    return parseInt($.css(el,p))||0; 
};

})(jQuery);


