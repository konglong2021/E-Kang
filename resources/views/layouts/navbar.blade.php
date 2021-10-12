<nav class="navbar top-navbar bg-white box-shadow">
    <div class="container-fluid">
        <div class="row">
            <div class="navbar-header no-padding">
                <a class="navbar-brand" href="/">
                    {{-- <img src="{{asset('backend/images/logo-dark.svg')}}" alt=" Admin Template" class="logo"> --}}
                    E Kang POS
                </a>
                <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-ellipsis-v"></i>
                </button>
                <button type="button" class="navbar-toggle mobile-nav-toggle" >
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <!-- /.navbar-header -->

            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul class="nav navbar-nav" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                    <li class="hidden-sm hidden-xs"><a href="#" class="user-info-handle"><i class="fa fa-user"></i></a></li>
                    <li class="hidden-sm hidden-xs"><a href="#" class="full-screen-handle"><i class="fa fa-arrows-alt"></i></a></li>
                    <li class="hidden-sm hidden-xs"><a href="#"><i class="fa fa-search"></i></a></li>
                    <li class="hidden-xs hidden-xs"><!-- <a href="#">My Tasks</a> --></li>
                    {{-- <li class=""><a href="#" class="color-primary"><i class="fa fa-diamond"></i> Upgrade</a></li> --}}
                </ul>
                <!-- /.nav navbar-nav -->

                <ul class="nav navbar-nav navbar-right" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle bg-primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-plus-circle"></i> Add New <span class="caret"></span></a>
                        <ul class="dropdown-menu" >
                            <li><a href="#"><i class="fa fa-plus-square-o"></i> Customer</a></li>
                            <li><a href="#"><i class="fa fa-plus-square-o"></i> Employee</a></li>
                            <li><a href="#"><i class="fa fa-plus-square-o"></i> Estimate</a></li>
                            <li><a href="#"><i class="fa fa-plus-square-o"></i> Task</a></li>
                            <li><a href="#"><i class="fa fa-plus-square-o"></i> Team Member</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Create Order</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Generate Report</a></li>
                        </ul>
                    </li>
                    <!-- /.dropdown -->
                    {{-- <li><a href="#" class=""><i class="fa fa-bell"></i></a></li> --}}
                    {{-- <li><a href="#" class=""><i class="fa fa-comments"></i></a></li> --}}
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{Auth::user()->name}} <span class="caret"></span></a>
                        <ul class="dropdown-menu profile-dropdown">
                            <li class="profile-menu bg-gray">
                                <div class="">
                                    <img src="http://placehold.it/60/c2c2c2?text=User" alt="John Doe" class="img-circle profile-img">
                                    <div class="profile-name">
                                        <h6>{{Auth::user()->name}}</h6>
                                       
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li><a href="{{ route('profile.show') }}"><i class="fa fa-cog"></i> Settings</a></li>
                            {{-- <li><a href="#"><i class="fa fa-sliders"></i> Account Details</a></li> --}}
                            <li role="separator" class="divider"></li>

                           
                            <li> 
                                <form method="POST" action="{{ route('logout') }}" class="color-danger text-center">
                                @csrf

                                <a href="{{ route('logout') }}"
                                         onclick="event.preventDefault();
                                                this.closest('form').submit();" >
                                    <i class="fa fa-sign-out"> Logout</i>
                                 </a>
                                </form>
                              
                            </li>
                        </ul>
                    </li>
                    <!-- /.dropdown -->
                    <li><a href="#" class="hidden-xs hidden-sm open-right-sidebar"><i class="fa fa-ellipsis-v"></i></a></li>
                </ul>
                <!-- /.nav navbar-nav navbar-right -->
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</nav>