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

$(document).on('turbolinks:load', function() {

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

    $(".navbar-thumbnail").on("mouseover", function() {
        $(".menu").toggle();
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
})
