// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jQuery from "jquery"
import '../stylesheets/application.scss'

global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

Rails.start()
Turbolinks.start()
ActiveStorage.start()

/* Focus */
$(document).on('turbolinks:load', function() {
    /* On click events */
    $("nav li").on("mouseover", function(){
        $("body").find(".active").removeClass("active");
        $(this).addClass("active");
    });

    $("footer li").on("mouseover", function(){
        $("body").find(".active").removeClass("active");
        $(this).addClass("active");
    });

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
