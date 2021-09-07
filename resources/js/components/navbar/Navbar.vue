<template>
    <nav class="navbar top-navbar bg-white box-shadow background-nav">
        <div class="container-fluid"></div>
    </nav>
</template>
<script type="text/javascript">
    import $ from "jquery";

    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
    });

    export default {
        name: 'Navbar',
        data: () => ({
        }),
        mounted ()  {
            $(function($) {
                "use strict";
                $('.mobile-nav-toggle').on('click', function(event){
                    event.preventDefault();
                    $('.left-sidebar').toggle();
                })
            });
        }
    }
</script>
<style>
    .background-nav{
        background-color: #875A7B;
    }
</style>
