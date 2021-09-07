<template>
        <div class="main-wrapper">
            <navbar></navbar>
            <div class="content-wrapper">
                <div class="content-container">
                    <div class="main-page ">
                        <div class="left-screen">
                            <h1>Left screen</h1>
                        </div>
                        <div class="right-screen">
                            <div class="side-bar">
                                <div class="content-sidebar">
                                    <ul>
                                        <li>
                                            <a>
                                                <span><i class="fa fa-home fa-2x"></i></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span>
                                                    <img v-bind:src="'../../../../public/images/bc-arrow-big.png'"/>
                                                    <i class="fa fa-home fa-2x"></i>
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span><i class="fa fa-home fa-2x"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                           <div class="display-inline-block">
                               <slot/>
                           </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
</template>

<script>
    import Navbar from "../navbar/Navbar"
    import Sidebar from "../sidebar/Sidebar"
    export default {
        name: 'Default',
        components: { Navbar, Sidebar },
        data: () => ({
        }),
    }
</script>

<style>
    .left-screen{
        vertical-align: top;
        display: inline-block;
        overflow: hidden;
        width: 33%;
        height: 100%;
    }
    .right-screen{
        display: inline-block;
        vertical-align: top;
        overflow: hidden;
        height: 100%;
        width: 66.6666666667%;
    }
    .right-screen .side-bar{
        display: inline-block;
        vertical-align: top;
        background: #d3d3d3;
        display: inline-block;
        overflow: hidden;
        width: 100%;
        height: 100%;
    }
    .right-screen .side-bar .content-sidebar {
        display: inline-block;
        vertical-align: top;
        position: relative;
        overflow: hidden;
        width: 100%;
        height: 100%;
        border-bottom: solid 3px rgb(110, 200, 155);
    }
    .right-screen .side-bar .content-sidebar ul{
        list-style: none;
        width: 100%;
        height: 100%;
        margin: 0 !important;
        padding: 0 !important;
    }
    .right-screen .side-bar .content-sidebar ul li {
        display: inline-block;
        height:100%;
        margin: 0 15px;
    }
    .right-screen .side-bar .content-sidebar ul li a{
        display: inline-block;
    }
    .right-screen .side-bar .content-sidebar ul li a span{
        height: 50px;
        line-height: 56px;
        display: inline-block;
    }
</style>
