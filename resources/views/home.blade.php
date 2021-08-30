
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Options Admin - Responsive Web Application Kit</title>

        <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="{{asset('backend/css/bootstrap.min.css')}}" media="screen" >
        <link rel="stylesheet" href="{{asset('backend/css/font-awesome.min.css')}}" media="screen" >
        <link rel="stylesheet" href="{{asset('backend/css/animate-css/animate.min.css')}}" media="screen" >
        <link rel="stylesheet" href="{{asset('backend/css/lobipanel/lobipanel.min.css')}}" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
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
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                			<a class="navbar-brand" href="index.html">
                			    <img src="{{asset('backend/images/logo-dark.svg')}}" alt="Options - Admin Template" class="logo">
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
                					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">John Doe <span class="caret"></span></a>
                					<ul class="dropdown-menu profile-dropdown">
                						<li class="profile-menu bg-gray">
                						    <div class="">
                						        <img src="http://placehold.it/60/c2c2c2?text=User" alt="John Doe" class="img-circle profile-img">
                                                <div class="profile-name">
                                                    <h6>John Doe</h6>
                                                    <a href="#">View Profile</a>
                                                </div>
                                                <div class="clearfix"></div>
                						    </div>
                						</li>
                						<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                						<li><a href="#"><i class="fa fa-sliders"></i> Account Details</a></li>
                						<li role="separator" class="divider"></li>
                						<li><a href="#" class="color-danger text-center"><i class="fa fa-sign-out"></i> Logout</a></li>
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

            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                    <div class="left-sidebar bg-black-300 box-shadow">
                        <div class="sidebar-content">
                            <div class="user-info closed">
                                <img src="http://placehold.it/90/c2c2c2?text=User" alt="John Doe" class="img-circle profile-img">
                                <h6 class="title">John Doe</h6>
                                <small class="info">PHP Developer</small>
                            </div>
                            <!-- /.user-info -->


                            <!-- ========== MAIN SIDEBAR ========== -->

                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main Category</span>
                                    </li>
                                    <li class="has-children">
                                        <a href="/"><i class="fa fa-dashboard"></i> <span>Dashboard</span> </a>
                                    </li>
                                   

                                    <li class="nav-header">
                                        <span class="">POS System</span>
                                    </li>
                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-building"></i> <span>Inventory</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-sitemap"></i> <span>Supplier</span></a></li>
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>Warehouse</span></a></li>
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>Brand</span></a></li>
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>Category</span></a></li>
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>Products</span></a></li>                                            
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>Products Price</span></a></li>                                            
                                        </ul>
                                    </li>
                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-paint-brush"></i> <span>Sell Menu</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                          <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>VIP Member</span></a></li>
                                            <li><a href="layout-fixed-top.html"><i class="fa fa-tasks"></i> <span>Customer</span></a></li>
                                            <li><a href="color-danger.html"><i class="fa fa-bell"></i> <span>Orders</span></a></li>
                                            <li><a href="color-danger.html"><i class="fa fa-bell"></i> <span>Purchase</span></a></li>
                                            <li><a href="color-danger.html"><i class="fa fa-bell"></i> <span>Payment</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-header">
                                        <span class="">User System</span>
                                    </li>
                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-magic"></i> <span>User</span>  <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="ui-buttons.html"><i class="fa fa-plane"></i> <span>Users</span></a></li>
                                        </ul>
                                    </li>
                                    
                                </ul>
                                <!-- /.side-nav -->
                             
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->

                    <div class="main-page">
                        <div class="container-fluid">
                            
                            <!-- /.row -->
                      {{-- <div class="row breadcrumb-div">
                          <div class="col-md-6">
                            <ul class="breadcrumb">
                              <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
                              <li class="active">Dashboard - 2</li>
                            </ul>
                          </div>
                                <!-- /.col-md-6 -->
                                <div class="col-md-6 text-right">
                                    <a href="#"><i class="fa fa-comments"></i> Talk to us</a>
                                    <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                                </div>
                                <!-- /.col-md-6 -->
                      </div> --}}
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->

                        <section class="section">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat-2 bg-primary" href="#">
                                            <div class="stat-content">
                                                <span class="number counter">1,411</span>
                                                <span class="name">Comments</span>
                                            </div>
                                            <span class="stat-footer"><i class="fa fa-arrow-up color-success"></i> 5% growth in 3 hours</span>
                                        </a>
                                        <!-- /.dashboard-stat-2 -->

        <div class="src-code">
         <pre class="language-html"><code class="language-html">
            <a class="dashboard-stat-2 bg-primary" href="#">
             <div class="stat-content">
                <span class="number counter">1,411</span>
                      <span class="name">Comments</span>
             </div>
                    <span class="stat-footer"><i class="fa fa-arrow-up color-success"></i> 5% growth in 3 hours</span>
            </a>
                <!-- /.dashboard-stat-2 -->

                <!-- ========== JS ========== -->
                <script>
                    $(function(){
                        $('.counter').counterUp();
                    });
                </script>
          </code></pre>
        </div>
                                        <!-- /.src-code -->
                                    </div>
                                    <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat-2 bg-danger" href="#">
                                            <div class="stat-content">
                                                <span class="number counter">322</span>
                                                <span class="name">Total Tickets</span>
                                            </div>
                                            <span class="stat-footer"><i class="fa fa-arrow-down color-success"></i> 3% decrease in 3 hours</span>
                                        </a>
                                        <!-- /.dashboard-stat-2 -->

    <div class="src-code">
      <pre class="language-html"><code class="language-html">
    <a class="dashboard-stat-2 bg-danger" href="#">
        <div class="stat-content">
            <span class="number counter">322</span>
            <span class="name">Total Tickets</span>
        </div>
        <span class="stat-footer"><i class="fa fa-arrow-down color-success"></i> 3% decrease in 3 hours</span>
    </a>
<!-- /.dashboard-stat-2 -->

<!-- ========== JS ========== -->
<script>
    $(function(){
        $('.counter').counterUp();
    });
</script>
        </code></pre>
    </div>
    <!-- /.src-code -->
</div>
<!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat-2 bg-warning" href="#">
                                            <div class="stat-content">
                                                <span class="number counter">5,551</span>
                                                <span class="name">Bank Credits</span>
                                            </div>
                                            <span class="stat-footer"><i class="fa fa-arrow-up color-success"></i> 7% increase in 3 hours</span>
                                        </a>
                                        <!-- /.dashboard-stat-2 -->

<div class="src-code">
    <pre class="language-html"><code class="language-html">
<a class="dashboard-stat-2 bg-warning" href="#">
    <div class="stat-content">
        <span class="number counter">5,551</span>
        <span class="name">Bank Credits</span>
    </div>
    <span class="stat-footer"><i class="fa fa-arrow-up color-success"></i> 7% increase in 3 hours</span>
</a>
<!-- /.dashboard-stat-2 -->

<!-- ========== JS ========== -->
<script>
    $(function(){
        $('.counter').counterUp();
    });
</script>
                                            </code></pre>
                                        </div>
                                        <!-- /.src-code -->
                                    </div>
                                    <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat-2 bg-success" href="#">
                                            <div class="stat-content">
                                                <span class="number counter">16,710</span>
                                                <span class="name">Bank Credits</span>
                                            </div>
                                            <span class="stat-footer"><i class="fa fa-arrow-down color-danger"></i> 2% decrese in 3 hours</span>
                                        </a>
                                        <!-- /.dashboard-stat-2 -->

                                        <div class="src-code">
                                            <pre class="language-html"><code class="language-html">
<a class="dashboard-stat-2 bg-success" href="#">
    <div class="stat-content">
        <span class="number counter">16,710</span>
        <span class="name">Bank Credits</span>
    </div>
    <span class="stat-footer"><i class="fa fa-arrow-down color-danger"></i> 2% decrese in 3 hours</span>
</a>
<!-- /.dashboard-stat-2 -->

<!-- ========== JS ========== -->
<script>
    $(function(){
        $('.counter').counterUp();
    });
</script>
             </code></pre>
         </div>
         <!-- /.src-code -->
     </div>
     <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

 </div>
 <!-- /.row -->
</div>
<!-- /.container-fluid -->
</section>
<!-- /.section -->

                       

 <section class="section pt-n">
     <div class="container-fluid">
         <div class="row">
             <div class="col-md-8">
                 <div class="panel border-primary no-border border-3-top">
                     <div class="panel-heading">
                         <div class="panel-title col-xs-10">
                             <h5>Table <small>with actions</small></h5>
                         </div>
                         <div class="dropdown text-right">
                             <i class="fa fa-ellipsis-v dropdown-toggle" role="button" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                             <ul class="dropdown-menu dropdown-menu-right bg-gray-500" aria-labelledby="dropdownMenu3">
                                 <li><a href="#">Action</a></li>
                                 <li><a href="#">Another action</a></li>
                                 <li><a href="#">Something else here</a></li>
                             </ul>
                         </div>
                     </div>
       <div class="panel-body">
    
           <div class="table-responsive">
               <table class="table table-striped table-bordered">
               	<thead>
               		<tr>
               			<th>#</th>
               			<th>First Name</th>     
                     <th>Username</th>
                			<th>Activity</th>
                     <th>Labels</th>
                     <th>Action</th>
              		</tr>
              	</thead>
         	      <tbody>
               		<tr>
               			<th scope="row">1</th>
               			<td>
                               <b>Mark</b><br>
                               <small class="text-muted">mark@example.net</small>
                           </td>
                           <td>@mdo</td>
               			<td>
               			    <div class="color-success">
               			        <i class="fa fa-long-arrow-up"></i> 30%
               			    </div>
                               <small class="text-muted">Since last 2 days.</small>
               			</td>
                           <td>
                               <span class="label label-success label-bordered">Active</span>
                               <span class="label label-info label-bordered">New</span>
                               <span class="label label-warning label-bordered">Unverified</span>
                           </td>
                           <td>
                               <button type="button" class="btn btn-success btn-xs btn-labeled">Approve<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                               <button type="button" class="btn btn-danger btn-xs btn-labeled">Reject<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                           </td>
               		</tr>
               		<tr>
               			<th scope="row">2</th>
                           <td>
                               <b>Jacob</b><br>
                               <small class="text-muted">jacob@example.net</small>
                           </td>
                           <td>@jacon</td>
               			<td>
               			    <div class="color-danger">
               			        <i class="fa fa-long-arrow-down"></i> -9%
               			    </div>
                               <small class="text-muted">Since last 3 days.</small>
               			</td>
                           <td>
                               <span class="label label-danger label-bordered">Inactive</span>
                               <span class="label label-warning label-bordered">Sleeping</span>
                           </td>
                           <td>
                               <button type="button" class="btn btn-success btn-xs btn-labeled">Approve<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                               <button type="button" class="btn btn-danger btn-xs btn-labeled">Reject<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                           </td>
               		</tr>
                       <tr>
               			<th scope="row">5</th>
                           <td>
                               <b>Sachin</b><br>
                               <small class="text-muted">sachin@example.net</small>
                           </td>
                           <td>@the.god</td>
               			<td>
               			    <div class="color-success">
               			        <i class="fa fa-long-arrow-up"></i> 50%
               			    </div>
                               <small class="text-muted">Since last 2 days.</small>
               			</td>
                           <td>
                               <span class="label label-success label-bordered">Active</span>
                               <span class="label label-info label-bordered">Super</span>
                           </td>
                           <td>
                               <button type="button" class="btn btn-success btn-xs btn-labeled" disabled="">Approved<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                               <button type="button" class="btn btn-danger btn-xs btn-labeled">Reject<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                           </td>
               		</tr>
               		<tr>
               			<th scope="row">3</th>
                           <td>
                               <b>Larry</b><br>
                               <small class="text-muted">larry@example.net</small>
                           </td>
                           <td>@larry</td>
               			<td>
               			    <div class="color-default">
               			        <i class="fa fa-long-arrow-up"></i> 0%
               			    </div>
                               <small class="text-muted">Since last 2 days.</small>
               			</td>
                           <td>
                               <span class="label label-warning label-bordered">Inactive</span>
                           </td>
                           <td>
                               <button type="button" class="btn btn-success btn-xs btn-labeled">Approve<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                               <button type="button" class="btn btn-danger btn-xs btn-labeled" disabled>Rejected<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                           </td>
               		</tr>
                       <tr>
               			<th scope="row">4</th>
                           <td>
                               <b>Salman</b><br>
                               <small class="text-muted">bhai@example.net</small>
                           </td>
                           <td>@bhai</td>
               			<td>
               			    <div class="color-suucess">
               			        <i class="fa fa-long-arrow-up"></i> 25%
               			    </div>
                               <small class="text-muted">Since last 2 days.</small>
               			</td>
                           <td>
                               <span class="label label-success label-bordered">active</span>
                           </td>
                           <td>
                               <button type="button" class="btn btn-success btn-xs btn-labeled">Approve<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                               <button type="button" class="btn btn-danger btn-xs btn-labeled">Reject<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                           </td>
               		</tr>
                       <tr>
               			<th scope="row">6</th>
                           <td>
                               <b>Mark</b><br>
                               <small class="text-muted">markf@example.net</small>
                           </td>
                           <td>@faceb</td>
               			<td>
               			    <div class="color-danger">
               			        <i class="fa fa-long-arrow-down"></i> 24%
               			    </div>
                               <small class="text-muted">Since last 2 days.</small>
               			</td>
                           <td>
                               <span class="label label-danger label-bordered">Unverified</span>
                           </td>
                           <td>
                               <button type="button" class="btn btn-success btn-xs btn-labeled">Approve<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                               <button type="button" class="btn btn-danger btn-xs btn-labeled">Reject<span class="btn-label btn-label-right"><i class="fa fa-times"></i></span></button>
                           </td>
               		</tr>
               	</tbody>
               </table>
           </div>
                                                <!-- /.table-responsive -->


      </div>
   </div>
 <!-- /.panel -->
 </div>
 <!-- /.col-md-6 -->

<div class="col-md-4">
<div class="panel-group acc-panels" id="accordion6" role="tablist" aria-multiselectable="true">
    <div class="panel">
        <div class="panel-heading" role="tab" id="heading11One">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion6" href="#collapse11One" aria-expanded="true" aria-controls="collapse11One">
                  Why Choose Options? <i class="fa fa-plus icon-plus-right"></i>
                </a>
            </h4>
        </div>
        <div id="collapse11One" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading11One">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw
                denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading" role="tab" id="heading11Two">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion6" href="#collapse11Two" aria-expanded="false" aria-controls="collapse11Two">
                    Everything is special. <i class="fa fa-plus icon-plus-right"></i>
                </a>
            </h4>
        </div>
        <div id="collapse11Two" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11Two">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw
                denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading" role="tab" id="heading11Three">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion6" href="#collapse11Three" aria-expanded="false" aria-controls="collapse11Three">
                  You would love it! <i class="fa fa-plus icon-plus-right"></i>
                </a>
            </h4>
        </div>
        <div id="collapse11Three" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11Three">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw
                denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
</div>

<div class="src-code">
    <pre class="language-html"><code class="language-html">

      <div class="panel-group acc-panels" id="accordion6" role="tablist" aria-multiselectable="true">

        <div class="panel">
        <div class="panel-heading" role="tab" id="heading11One">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion6" href="#collapse11One" aria-expanded="true" aria-controls="collapse11One">
                  Why Choose Options? <i class="fa fa-plus icon-plus-right"></i>
                </a>
            </h4>
        </div>
        <div id="collapse11One" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading11One">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw
                denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading" role="tab" id="heading11Two">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion6" href="#collapse11Two" aria-expanded="false" aria-controls="collapse11Two">
                    Everything is special. <i class="fa fa-plus icon-plus-right"></i>
                </a>
            </h4>
        </div>
        <div id="collapse11Two" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11Two">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw
                denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading" role="tab" id="heading11Three">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion6" href="#collapse11Three" aria-expanded="false" aria-controls="collapse11Three">
                  You would love it! <i class="fa fa-plus icon-plus-right"></i>
                </a>
            </h4>
        </div>
        <div id="collapse11Three" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11Three">
            <div class="panel-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw
                denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
</div>
             </code></pre>
         </div>
         <!-- /.src-code -->
     </div>
     <!-- /.col-md-6 -->
     </div>
     <!-- /.row -->
     </div>
     <!-- /.container-fluid --> 
 </section>
 <!-- /.section -->
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
        <script src="{{asset('backend/js/prism/prism.js')}}"></script>
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

        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
    </body>
</html>
