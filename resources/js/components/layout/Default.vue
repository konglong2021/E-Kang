<template>
        <div class="main-wrapper">
            <navbar></navbar>
            <div class="content-wrapper">
                <div class="content-container">
                    <sidebar></sidebar>
                    <div class="main-page">
                        <slot/>
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
