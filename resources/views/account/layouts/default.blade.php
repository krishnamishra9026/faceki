<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name') }}</title>

    <!-- Favicon -->
    <link rel="icon" href="{{ asset('assets/img/brand/favicon.png') }}" type="image/png"> 
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="{{ asset('assets/vendor/nucleo/css/nucleo.css') }}" type="text/css">
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script>
        window.Laravel = {!! json_encode([
            'user' => auth()->check() ? auth()->user() : null,
            //'company' => userCompany() ? userCompany() : null,
            'base_url' => config('app.url'),
            //'spa_url' => config('app.spa_url'),
            //'language' => \Lang::locale()
        ]) !!}
    </script>
    <!-- Icons -->
    <link href="{{ asset('argon/vendor/nucleo/css/nucleo.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/flag-icon.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/argon.mine209.css?v=1.0.0') }}" type="text/css">
    <link rel="stylesheet" href="{{ asset('assets/css/custom.css') }}" type="text/css">
    <link rel="stylesheet" href="{{ asset('assets/css/custom-lib.css') }}">
    <style>
        .header {
            /* margin-bottom:80px ; */
        }
    </style>
    @yield('styles')

</head><body>
    <div id="app">
        <!-- Start Header -->
        <header class="header">
            <div class="container-fluid">
                <div class="row justify-content-between">

                    <div class="ml-4 mt-2 logo-area d-flex">
                        <div class="bar">
                            <a id="openSidebar"class="sidenav-toggler d-none d-xl-block mt-1" data-action="sidenav-unpin"
                            data-target="#sidenav-main"><img src="{{ asset('assets/images/list-menu.png') }}" width="40"
                                    alt="Menu Bar"></a>
                            <!-- Sidenav toggler -->
                        </div>
                        <div class="logo ml-2">
                            <a href="{{ route('account.dashboard') }}"><img src="{{ asset('saas/img/logo.png') }}" width="85" alt="Logo"></a>
                        </div>
                    </div>

                    <div class="user-aera d-flex align-items-center">
                        <div>
                            <span class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" style="border-bottom: 0;
                                background-color: transparent;"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="flag-icon flag-icon-{{ app()->getLocale() == 'en' ? 'gb' : app()->getLocale() }}" style="line-height: 2em;"></span>
                                    {{-- ({{ strtoupper(app()->getLocale()) }}) --}}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownLanguageLink" style="padding-left:10px;">
                                    <li><a href="{{ url('locale/en') }}" >{{ __('languages.english') }}</a></li>
                        
                                    <li><a href="{{ url('locale/nl') }}" >{{ __('languages.nederlands') }}</a></li>
                                    
                                </ul>
                            </span>
                        </div>
                        <div>
                            <ul>
                                <li class="nav-item dropdown" style="top: 8px;">
                                    <notification></notification>
                                </li>
                            </ul>
                        </div>

                        <div class="flags ml-4">
                            <ul class="navbar-nav align-items-center ml-auto ml-md-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <div class="media align-items-center">
                                            <span class="avatar avatar-sm rounded-circle" style="background-color:transparent;">
                                                <!-- <img alt="Image placeholder" src="{{ asset('storage'.auth()->user()->image) }}"> -->
                                                <img alt="Image placeholder" src="{{ asset('/assets/img/avatar.png') }}">
                                            </span>
                                            <div class="media-body ml-2 d-none d-lg-block">
                                                {{-- <span class="mb-0 text-sm  font-weight-bold">{{ Auth::user()->first_name }}</span> --}}
                                            </div>
                                        </div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <div class="dropdown-header noti-title">
                                            <h6 class="text-overflow m-0">{{ __('sidebar_menu.welcome') }}</h6>
                                        </div>
                                        <a class="dropdown-item"
                                            href="{{ route('account.dashboard') }}">
                                            <i class="ni ni-settings-gear-65"></i>
                                                <span>{{ __('account.my_dashboard') }}</span>
                                        </a>
                                        <!-- User Account Link -->
                                        <a class="dropdown-item" href="{{ route('account.profile.index') }}">
                                            <i class="ni ni-single-02"></i>
                                            <span>{{ __('account.my_account') }}</span>
                                        </a>
                                        @if(config('app.real_estate_portal') == 'on')
                                        <a href="{{ route('agency.company.listing') }}" class="dropdown-item">
                                            <i class="fas fa-home"></i>
                                            <span>{{ __('sidebar_menu.objects') }}</span>
                                        </a>
                                        @endif
                                        <!-- Developer Link -->
                                        {{-- <a class="dropdown-item" href="{{ route('developer.index') }}">
                                            <i class="ni ni-chart-bar-32"></i>
                                            <span>{{ __('sidebar_menu.developer_panel') }}</span>
                                        </a> --}}
                                        <!-- Impersonating -->
                                        @impersonating
                                        <a class="dropdown-item" href="#"
                                        onclick="event.preventDefault(); document.getElementById('impersonate-form').submit();">
                                            <i class="ni ni-user-run"></i>
                                            <span>{{ __('account.stop_impersonate') }}</span>
                                        </a>
                                        <form id="impersonate-form" action="{{ route('admin.users.impersonate.destroy') }}"
                                            method="POST" style="display: none;">
                                            @csrf
                                            @method('DELETE')
                                        </form>
                                        @endimpersonating
            
                                        <!-- Admin Panel Link -->
                                        @role('admin')
                                        <a class="dropdown-item" href="{{ route('admin.dashboard') }}">
                                            <i class="ni ni-circle-08"></i>
                                            <span>{{ __('account.admin_panel') }}</span>
                                        </a>
                                        @endrole
                                        <div class="dropdown-divider"></div>
            
                                        <a class="dropdown-item" href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                                        <i class="ni ni-user-run"></i>
                                        {{ __('account.logout') }}
                                        </a>
            
                                        @include('layouts.partials.forms._logout')
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
    </header>
    <!-- End Header -->

    <!-- Sidenav -->
    @include('account.layouts.partials.sidebar')
    
    <!-- Main content -->
    <div class="main-content " id="panel" style="">
        {{-- @include('layouts.partials._navigation') --}}
        <!-- Topnav -->
        {{-- @include('account.layouts.partials.topnav') --}}
        <!-- Header -->
        <div class="container">
            @include('layouts.partials.alerts._alerts')
        </div>
        <!-- Header -->
        {{-- <div class="header">

        </div> --}}
        <!-- Page content -->
        <div class="container-fluid">

            @yield('content')
        </div>

    </div>
    </div>
    <!-- end id=App
    Argon Scripts -->
    <!-- Core -->
    <script src="{{ asset('js/app.js') }}"></script>

    <script src="{{ asset('assets/vendor/js-cookie/js.cookie.js') }}"></script>
    <script src="{{ asset('assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/lavalamp/js/jquery.lavalamp.min.js') }}"></script>
    <!-- Optional JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <!-- Argon JS -->
    <script src="{{ asset('assets/js/argon.mine209.js?v=1.0.0') }}"></script>
    <!-- Scripts -->
    @yield('scripts')

    @if (env('TAWKTO_ID'))
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {},
            Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"),
                s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/{{ env('
            TAWKTO_ID ') }}/default';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <!--End of Tawk.to Script-->
    @endif

</body>

</html>