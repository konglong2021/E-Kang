
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>E Kang POS System</title>

        <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="{{asset('backend/css/bootstrap.min.css')}}" media="screen" >
        <link rel="stylesheet" href="{{asset('backend/css/font-awesome.min.css')}}" media="screen" >
        <link rel="stylesheet" href="{{asset('backend/css/animate-css/animate.min.css')}}" media="screen" >
        <link rel="stylesheet" href="{{asset('backend/css/lobipanel/lobipanel.min.css')}}" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        
        <link rel="stylesheet" href="{{asset('backend/css/icheck/skins/line/blue.css')}}" >
        <link rel="stylesheet" href="{{asset('backend/css/icheck/skins/line/red.css')}}" >
        <link rel="stylesheet" href="{{asset('backend/css/icheck/skins/line/green.css')}}" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="{{asset('backend/css/main.css')}}" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="{{asset('backend/js/modernizr/modernizr.min.js')}}"></script>
    </head>
    <body class="top-navbar-fixed">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
            @include('layouts.navbar')

            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                    @include('layouts.sidebar')
                    <!-- /.left-sidebar -->

                    <div class="main-page">

                       @yield('content')

                    </div>
                    <!-- /.main-page -->

                   

                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->

        <!-- ========== COMMON JS FILES ========== -->
        <script src="{{asset('backend/js/jquery/jquery-2.2.4.min.js')}}"></script>
        <script src="{{asset('backend/js/jquery-ui/jquery-ui.min.js')}}"></script>
        <script src="{{asset('backend/js/bootstrap/bootstrap.min.js')}}"></script>
        <script src="{{asset('backend/js/pace/pace.min.js')}}"></script>
        <script src="{{asset('backend/js/lobipanel/lobipanel.min.js')}}"></script>
        <script src="{{asset('backend/js/iscroll/iscroll.js')}}"></script>

        <!-- ========== PAGE JS FILES ========== -->
   
        <script src="{{asset('backend/js/waypoint/waypoints.min.js')}}"></script>
        <script src="{{asset('backend/js/counterUp/jquery.counterup.min.js')}}"></script>
        <script src="{{asset('backend/js/amcharts/amcharts.js')}}"></script>
        <script src="{{asset('backend/js/amcharts/serial.js')}}"></script>
        <script src="{{asset('backend/js/amcharts/pie.js')}}"></script>
        <script src="{{asset('backend/js/amcharts/plugins/export/export.min.js')}}"></script>
        <link rel="stylesheet" href="{{asset('backend/js/amcharts/plugins/export/export.css')}}" type="text/css" media="all" />
        <script src="{{asset('backend/js/amcharts/themes/light.js')}}"></script>
        <script src="{{asset('backend/js/icheck/icheck.min.js')}}"></script>

        <!-- ========== THEME JS ========== -->
        <script src="{{asset('backend/js/main.js')}}"></script>
        <script src="{{asset('backend/js/bar-chart.js')}}"></script>
        <script src="{{asset('backend/js/pie-chart.js')}}"></script>
        <script src="{{asset('backend/js/task-list.js')}}"></script>
        <script>
            $(function(){

                // Counter for dashboard stats
                $('.counter').counterUp({
                    delay: 10,
                    time: 1000
                });

            });
        </script>
        @stack('Script')

        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
    </body>

</html>
