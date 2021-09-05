<template>
    <div class="left-sidebar bg-black-300 box-shadow">
        <div class="sidebar-content">
            <div class="user-info closed">
                <img src="http://placehold.it/90/c2c2c2?text=User" alt="John Doe" class="img-circle profile-img">
                <h6 class="title">John Doe</h6>
                <small class="info">PHP Developer</small>
            </div>
            <div class="sidebar-nav">
                <ul class="side-nav color-gray">
                    <li v-for="item in menuItems" v-bind:class="{ 'nav-header': !item.icon,  'has-children': item.icon}">
                        <span v-if="!item.icon" v-bind:class="item.icon">{{ (item.label) }}</span>
                        <a v-if="item.icon">
                            <i v-bind:class="item.icon"></i>
                            <span class="cursor-pointer" @click="redirectInventory(item.link)">{{ (item.label) }}</span>
                            <i class="fa fa-angle-right arrow"></i>
                            <ul v-if="item.subItems" class="child-nav">
                                <li  v-for="subItem in item.subItems">
                                    <a><i v-bind:class="subItem.icon"></i>
                                        <span class="cursor-pointer">{{ (subItem.label) }}</span>
                                    </a>
                                </li>
                            </ul>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script type="text/javascript">
    import {menuItems} from '../menu/menu-item'

    export default {
        name: 'Sidebar',
        data: () => ({
            menuItems: menuItems,
        }),
        mounted () {
            $(function($) {
                "use strict";

                // Toggle user info on sidebar
                $('.user-info-handle').on('click', function(event){
                    event.preventDefault();
                    $('.user-info').toggleClass('closed');
                });

                // Toggle small sidebar
                $('.small-nav-handle').on('click', function(event){
                    event.preventDefault();
                    $('.left-sidebar').toggleClass('small-nav');
                    $('.navbar-header').toggleClass('small-nav-header');
                });

                // Toggle Mobile Nav
                $('.mobile-nav-toggle').on('click', function(event){
                    event.preventDefault();
                    $('.left-sidebar').toggle();
                });

                // For custom modal backdrop
                $('.modal[data-backdrop-color]').on('show.bs.modal hide.bs.modal', function () {
                    $('body').toggleClass('modal-color-'+ $(this).data('backdropColor'));
                });

                // Open right sidebar
                $('.open-right-sidebar').on('click', function(event){
                    event.preventDefault();
                    $('.right-sidebar, .right-sidebar .sidebar-content').css('right','0px');
                });
                $('.right-sidebar .close-icon').on('click', function(event){
                    event.preventDefault();
                    $('.right-sidebar, .right-sidebar .sidebar-content').css('right','-400px');
                });

                // Initialize panel controls
                $('[data-panel-control]').lobiPanel();

                // Visibility of source code button
                $('.src-btn').hide();
                $('.toggle-help-handle').on('click', function(event){
                    event.preventDefault();
                    $('.src-btn').toggle();
                });

                // Visibility of source code button
                $('.src-code').hide();
                $('.toggle-code-handle').on('click', function(event){
                    event.preventDefault();
                    $('.src-code').toggle();
                });

                // Toggle full screen
                $('.full-screen-handle').on('click', function(event){
                    event.preventDefault();
                    if ((document.fullScreenElement && document.fullScreenElement !== null) ||
                        (!document.mozFullScreen && !document.webkitIsFullScreen)) {
                        if (document.documentElement.requestFullScreen) {
                            document.documentElement.requestFullScreen();
                        } else if (document.documentElement.mozRequestFullScreen) {
                            document.documentElement.mozRequestFullScreen();
                        } else if (document.documentElement.webkitRequestFullScreen) {
                            document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
                        }
                    } else {
                        if (document.cancelFullScreen) {
                            document.cancelFullScreen();
                        } else if (document.mozCancelFullScreen) {
                            document.mozCancelFullScreen();
                        } else if (document.webkitCancelFullScreen) {
                            document.webkitCancelFullScreen();
                        }
                    }
                });

                // Toggle sidebar dropdown
                $('.has-children').not('.open').find('.child-nav').slideUp('100');
                $('.has-children>a').on('click', function(event){
                    event.preventDefault();
                    $(this).parent().toggleClass('open');
                    $(this).parent().find('.child-nav').slideToggle('500');
                });

                // For Dropdown menu animation
                var dropdownSelectors = $('.dropdown, .dropup');

                // Custom function to read dropdown data
                // =========================
                function dropdownEffectData(target) {
                    // @todo - page level global?
                    var effectInDefault = null,
                        effectOutDefault = null;
                    var dropdown = $(target),
                        dropdownMenu = $('.dropdown-menu', target);
                    var parentUl = dropdown.parents('ul.nav');

                    // If parent is ul.nav allow global effect settings
                    if (parentUl.size() > 0) {
                        effectInDefault = parentUl.data('dropdown-in') || null;
                        effectOutDefault = parentUl.data('dropdown-out') || null;
                    }

                    return {
                        target: target,
                        dropdown: dropdown,
                        dropdownMenu: dropdownMenu,
                        effectIn: dropdownMenu.data('dropdown-in') || effectInDefault,
                        effectOut: dropdownMenu.data('dropdown-out') || effectOutDefault,
                    };
                }

                // Custom function to start effect (in or out)
                // =========================
                function dropdownEffectStart(data, effectToStart) {
                    if (effectToStart) {
                        data.dropdown.addClass('dropdown-animating');
                        data.dropdownMenu.addClass('animated');
                        data.dropdownMenu.addClass(effectToStart);
                    }
                }

                // Custom function to read when animation is over
                // =========================
                function dropdownEffectEnd(data, callbackFunc) {
                    var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
                    data.dropdown.one(animationEnd, function() {
                        data.dropdown.removeClass('dropdown-animating');
                        data.dropdownMenu.removeClass('animated');
                        data.dropdownMenu.removeClass(data.effectIn);
                        data.dropdownMenu.removeClass(data.effectOut);

                        // Custom callback option, used to remove open class in out effect
                        if (typeof callbackFunc == 'function') {
                            callbackFunc();
                        }
                    });
                }

                // Bootstrap API hooks
                // =========================
                dropdownSelectors.on({
                    "show.bs.dropdown": function() {
                        // On show, start in effect
                        var dropdown = dropdownEffectData(this);
                        dropdownEffectStart(dropdown, dropdown.effectIn);
                    },
                    "shown.bs.dropdown": function() {
                        // On shown, remove in effect once complete
                        var dropdown = dropdownEffectData(this);
                        if (dropdown.effectIn && dropdown.effectOut) {
                            dropdownEffectEnd(dropdown, function() {});
                        }
                    },
                    "hide.bs.dropdown": function(e) {
                        // On hide, start out effect
                        var dropdown = dropdownEffectData(this);
                        if (dropdown.effectOut) {
                            e.preventDefault();
                            dropdownEffectStart(dropdown, dropdown.effectOut);
                            dropdownEffectEnd(dropdown, function() {
                                dropdown.dropdown.removeClass('open');
                            });
                        }
                    },
                });
            });
        },
        methods:{
            redirectInventory($route){
                this.$router.push($route).catch(() => {});
            }
        }
    }
</script>
<style>
    .cursor-pointer{
        cursor: pointer;
    }
</style>
