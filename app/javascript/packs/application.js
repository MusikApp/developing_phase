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
import Chartkick from 'chartkick'
import Highcharts from 'highcharts'
window.Highcharts = Highcharts

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

    $(document).on("mouseup", function(e) {
        const container = $(".notifications")
    
        if (!container.is(e.target) && container.has(e.target).length === 0) 
        {
            container.removeClass("active");
        }
    })

    /* Foot Search Section */

    $(".foot-search").on("click", function(e){
        let target = e.target.parentElement;

        if (target.classList.contains("active")) {
            $(target).removeClass("active");
        } else {
            $(target).addClass("active");
        }
    });

    /* Post Options */

    $(".fa-ellipsis-v").on("click", function(e) {
        let parent = e.target.parentElement.lastElementChild;
        $(parent).toggle();

        $(document).on("mouseup", function(e) {
            const container = $(".profile-post-options");
        
            if (!container.is(e.target) && container.has(e.target).length === 0) 
            {
                container.hide();
            }
        })
    })

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

    $(document).on("mouseup", function(e) {
        const container = $(".footer-search-section");
    
        if (!container.is(e.target)) 
        {
            container.hide(); 
            $(".foot-search").removeClass("active");
        }
    })

    /* Navbar Menu */

    $(".navbar-thumbnail").on("click", function() {
        $(".menu").toggle();
        
        $(".menu-list").on("click", function() {
            $(".menu").hide();
        })
    });

    $(document).on("mouseup", function(e) {
        const container = $(".menu");
    
        if (!container.is(e.target)) 
        {
            container.hide();
        }
    })

    /* Footer Menu */

    $(".footer-thumbnail").on("click", function() {
        $(".mobile-menu").toggle();
        $(".mobile-menu-list").on("click", function() {
            $(".mobile-menu").hide();
        })
    })

    $(document).on("mouseup", function(e) {
        const container = $(".mobile-menu");
    
        if (!container.is(e.target)) 
        {
            container.hide();
        }
    })

    /* chatroom 

    $(".message").on("click", function(){
        $(".author").toggle()
    })*/
    var results = $("#results");
    var search = $("#search");
    search.on('click', function(){
        var query = $("#query").val();
            $.ajax({
                url: "https://theaudiodb.com/api/v1/json/1/search.php?s=" + query,
                method: "GET",
                dataType: "json",
                success: function(data) {
                    $.each(data.artists, function(i=0, artist){
                        results.html(`
                            <ul>
                                <li> Nombre : ${artist.strArtist} </li>
                                <li> Disquera : ${artist.strLabel} </li>
                                <li> Genero : ${artist.strGenre} </li>
                                <li> <img src="${artist.strArtistThumb}"> </li>

                            </ul>`);
                    })
                }
            });
    })

    // const getData = () => {
    //     var query = $("#query").value;
    //     console.log(query)
    //         $.ajax({
    //             url: "https://theaudiodb.com/api/v1/json/1/search.php?s=" + query,
    //             method: "GET",
    //             dataType: "json",
    //             success: function(artist) {
    //                 var str = "";          
    //                 str += '<p> Label : '+artist.strLabel+' </p>';               
    //                 results.innerHTML = str;
    //             }
    //         });
    // }

})



// Spotify API

//find template and compile it
// var templateSource = document.getElementById('results-template').innerHTML,
    // template = Handlebars.compile(templateSource),
    // resultsPlaceholder = document.getElementById('results')
    // playingCssClass = 'playing',
    // audioObject = null;

// var fetchTracks = function (albumId, callback) {
//     $.ajax({
//         url: 'https://api.spotify.com/v1/albums/' + albumId,
//         success: function (response) {
//             callback(response);
//         }
//     });
// };

// var searchAlbums = function (query) {
    // $.ajax({
    //     dataType: "json",
    //     url: 'theaudiodb.com/api/v1/json/1/search.php?s=coldplay',
    //     success: function (response) {
    //         $('#results').append('<p>'+ response.strLabel +'</p>')
    //         // resultsPlaceholder.innerHTML = template(response);
    //     }
    // });
// };



// results.addEventListener('click', function (e) {
//     var target = e.target;
//     if (target !== null && target.classList.contains('cover')) {
//         if (target.classList.contains(playingCssClass)) {
//             audioObject.pause();
//         } else {
//             if (audioObject) {
//                 audioObject.pause();
//             }
//             fetchTracks(target.getAttribute('data-album-id'), function (data) {
//                 audioObject = new Audio(data.tracks.items[0].preview_url);
//                 audioObject.play();
//                 target.classList.add(playingCssClass);
//                 audioObject.addEventListener('ended', function () {
//                     target.classList.remove(playingCssClass);
//                 });
//                 audioObject.addEventListener('pause', function () {
//                     target.classList.remove(playingCssClass);
//                 });
//             });
//         }
//     }
// });

// document.getElementById('search-form').addEventListener('submit', function (e) {
//     e.preventDefault();
//     searchAlbums(document.getElementById('query').value);
// }, false);


// var searchAlbums = function (query) {
//     $.ajax({
//         dataType: "json",
//         url: 'theaudiodb.com/api/v1/json/1/search.php?s=' + query,
//         success: function (response) {
//             response.strLabel
//             console.log(response.strLabel)
//             // resultsPlaceholder.innerHTML = template(response);
//         }
//     });
// };

// $('search-form').on('submit', function (e) {
//     e.preventDefault();
//     searchAlbums($('query').value);
// }, false);