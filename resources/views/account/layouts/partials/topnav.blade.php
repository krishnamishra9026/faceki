<nav class="navbar navbar-top navbar-expand navbar-light bg-secondary border-bottom">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Search form -->
                <ul class="navbar-nav align-items-center ml-md-auto">
                    <li class="nav-item d-xl-none">
                        <!-- Sidenav toggler -->
                        <div class="pr-3 sidenav-toggler sidenav-toggler-light" data-action="sidenav-pin" data-target="#sidenav-main">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                            </div>
                        </div>
                    </li>
                    <div style="width:120px; float: right; margin-right: 20px; margin-left: 20px;">
                        <span class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="flag-icon flag-icon-{{ app()->getLocale() == 'en' ? 'gb' : app()->getLocale() }}"></span>
                                    ({{ strtoupper(app()->getLocale()) }})
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownLanguageLink" style="padding-left:10px;">
                                    <li><a href="{{ url('locale/en') }}" >{{ __('languages.english') }}</a></li>
                        
                                    <li><a href="{{ url('locale/nl') }}" >{{ __('languages.nederlands') }}</a></li>
                                    
                                </ul>
                        </span>
                    </div>
                    <li class="nav-item dropdown">
                        <notification></notification>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                            <i class="ni ni-ungroup"></i>
                        </a>
                        <div
                            class="dropdown-menu dropdown-menu-lg dropdown-menu-dark bg-default dropdown-menu-right">
                            <div class="row shortcuts px-4">
                                <a href="#!" class="col-4 shortcut-item">
                                    <span class="shortcut-media avatar rounded-circle bg-gradient-red">
                                        <i class="ni ni-calendar-grid-58"></i>
                                    </span>
                                    <small>Calendar</small>
                                </a>
                                <a href="#!" class="col-4 shortcut-item">
                                    <span class="shortcut-media avatar rounded-circle bg-gradient-orange">
                                        <i class="ni ni-email-83"></i>
                                    </span>
                                    <small>Email</small>
                                </a>
                                <a href="#!" class="col-4 shortcut-item">
                                    <span class="shortcut-media avatar rounded-circle bg-gradient-info">
                                        <i class="ni ni-credit-card"></i>
                                    </span>
                                    <small>Payments</small>
                                </a>
                                <a href="#!" class="col-4 shortcut-item">
                                    <span class="shortcut-media avatar rounded-circle bg-gradient-green">
                                        <i class="ni ni-books"></i>
                                    </span>
                                    <small>Reports</small>
                                </a>
                                <a href="#!" class="col-4 shortcut-item">
                                    <span class="shortcut-media avatar rounded-circle bg-gradient-purple">
                                        <i class="ni ni-pin-3"></i>
                                    </span>
                                    <small>Maps</small>
                                </a>
                                <a href="#!" class="col-4 shortcut-item">
                                    <span class="shortcut-media avatar rounded-circle bg-gradient-yellow">
                                        <i class="ni ni-basket"></i>
                                    </span>
                                    <small>Shop</small>
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav align-items-center ml-auto ml-md-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <div class="media align-items-center">
                                <span class="avatar avatar-sm rounded-circle">
                                    <img alt="Image placeholder" src="{{ asset('storage'.auth()->user()->image) }}">
                                </span>
                                <div class="media-body ml-2 d-none d-lg-block">
                                    <span class="mb-0 text-sm  font-weight-bold">{{ Auth::user()->first_name }}</span>
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
                            <a class="dropdown-item" href="{{ route('account.index') }}">
                                <i class="ni ni-single-02"></i>
                                <span>{{ __('account.my_account') }}</span>
                            </a>
                            <a href="#!" class="dropdown-item">
                                <i class="ni ni-calendar-grid-58"></i>
                                <span>{{ __('account.activity') }}</span>
                            </a>
                            <!-- Developer Link -->
                            <a class="dropdown-item" href="{{ route('developer.index') }}">
                                <i class="ni ni-chart-bar-32"></i>
                                <span>{{ __('sidebar_menu.developer_panel') }}</span>
                            </a>
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
    </nav>
