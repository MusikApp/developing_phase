// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jQuery from "jquery"

global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

Rails.start()
Turbolinks.start()
ActiveStorage.start()

/* Focus */
$(document).on('turbolinks:load', function(e) {
    /* On click events */
    $(".fa-bell").on("click", function(e){
        let target = e.target.parentElement;

        if (target.classList.contains("active")) {
            $(target).removeClass("active");
        } else {
            $(target).addClass("active");
        }
    });

    $(".foot-search").on("click", function(e){
        let target = e.target.parentElement;

        if (target.classList.contains("active")) {
            $(target).removeClass("active");
        } else {
            $(target).addClass("active");
        }
        
    });

    /* switch actions */

    $(".switch").on("mousedown", function() {
        let checkbox = document.querySelector('input[type="checkbox"]');

        if (!checkbox.checked) {
            $(this).on("click", function() {
                $(".demo-form").show();
                $(".post-form").hide();
                $(".leyend").html('¿Quieres hacer una publicación?')
            })
        } else if (checkbox.checked) {
            $(this).on("click", function() {
                $(".demo-form").hide();
                $(".post-form").show();
                $(".leyend").html('¿Quieres publicar un demo?')
            })
        }
    })

    /* comments actions */

    $(".comments").on("click", function(e) {
        let comments = e.target.parentElement.parentElement.parentElement.lastElementChild;

        $(comments).toggle();
    })

    $(".comment-stats").on("click", function(e) {
        let comments = e.target.parentElement.parentElement.parentElement.lastElementChild;

        $(comments).toggle();
    })

    $("h6").on("click", function(e) {
        let reply = e.target.parentElement.lastElementChild;
        
        $(reply).toggle();
    })


    


    /* back2top */
    $(window).scroll(function() {
        var height = $(window).scrollTop();
        if (height > 100) {
            $('#back2Top').fadeIn();
        } else {
            $('#back2Top').fadeOut();
        }
    });
    $(document).ready(function() {
        $("#back2Top").click(function(event) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: 0 }, "slow");
            return false;
        });
    });

    /* active navbar item */
    $("#home").on("click", function() {

    })
    
    /* footer search bar */
    $(".foot-search").on("click", function() {
        $(".footer-search-section").toggle();
    })

    $(".navbar-thumbnail").on("mouseover", function() {
        $(".menu").show();
        $(document).on("mouseup", function(e) {
            const container = $(".menu");
        
            if (!container.is(e.target) && container.has(e.target).length === 0) 
            {
                container.hide();
            }
        })
        $(".menu-list").on("click", function() {
            $(".menu").hide();
        })
    })

    $(".footer-thumbnail").on("mouseover", function() {
        $(".mobile-menu").toggle();
        $(document).on("mouseup", function(e) {
            const container = $(".mobile-menu");
        
            if (!container.is(e.target) && container.has(e.target).length === 0) 
            {
                container.hide();
            }
        })
        $(".mobile-menu-list").on("click", function() {
            $(".mobile-menu").hide();
        })
    })
})
