<nav class="sidenav navbar navbar-vertical fixed-left navbar-expand-xs navbar-light bg-white" id="sidenav-main" style="top: 75px;">
    <div class="scrollbar-inner">
        <div class="navbar-inner">
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        
                <!-- Nav items -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('account.dashboard'), ' active') }}"
                            href="{{ route('account.dashboard') }}">
                            <i class="fas fa-tachometer-alt"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.dashboards') }}</span>
                        </a>
                    </li>
                    @if(config('app.object_scan') == 'on')
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('scan.index') or on_page('scan.list_scans'), ' active') }}" href="#navbar-scan" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-scan">
                            <i class="fas fa-file-contract"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.object_scan') }}</span>
                        </a>
                        <div class="collapse" id="navbar-scan">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('scan.index') }}">
                                        {{ __('sidebar_menu.new_object_scan') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('scan.list_scans') }}">
                                        {{ __('sidebar_menu.my_object_scans') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('scan.list_templates') }}">
                                        {{ __('sidebar_menu.templates') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    @endif
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('agency.company.listing') or on_page('agency.company.add_object') or on_page('agency.object.edit'), ' active') }}" href="#navbar-objects-01" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-objects-01">
                            <i class="fas fa-home"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.objects') }}</span>
                        </a>
                        <div class="collapse" id="navbar-objects-01">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('agency.company.add_object') }}">
                                        {{ __('sidebar_menu.add_object') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('agency.company.listing') }}">
                                        {{ __('sidebar_menu.objects') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    @if(config('app.document_designer') == 'on')
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('designer.index') or on_page('designer.list_books'), ' active') }}" href="#navbar-designer" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-designer">
                            <i class="fas fa-object-group"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.document_designer') }}</span>
                        </a>
                        <div class="collapse" id="navbar-designer">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('designer.index') }}">
                                        {{ __('sidebar_menu.designer') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('designer.list_books') }}">
                                        {{ __('sidebar_menu.my_books') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('designer.list_templates') }}">
                                        {{ __('sidebar_menu.templates') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    @endif
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('account.index') or on_page('account.profile.index') or on_page('account.password.index') or on_page('account.deactivate.index') or on_page('account.twofactor.index') or on_page('account.teams.index') or on_page('account.teams.create') or on_page('account.teams.members.show') or on_page('account.teams.edit') or on_page('account.teams.members.show') , ' active') }}" href="#navbar-examples" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-examples">
                            <i class="fas fa-user"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.account') }}</span>
                        </a>
                        <div class="collapse" id="navbar-examples">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link"
                                        href="{{ route('account.profile.index') }}">
                                        {{ __('sidebar_menu.profile') }}
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link"
                                        href="{{ route('account.teams.index') }}">
                                        {{ __('sidebar_menu.partners') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.password.index'), ' active') }}"
                                        href="{{ route('account.password.index') }}">
                                        {{ __('sidebar_menu.change_password') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.deactivate.index'), ' active') }}"
                                        href="{{ route('account.deactivate.index') }}">
                                        {{ __('sidebar_menu.deactivate_account') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.twofactor.index'), ' active') }}"
                                        href="{{ route('account.twofactor.index') }}">
                                        {{ __('sidebar_menu.two_factor') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!-- Start company -->
                    @if (isCompany())
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('agency.profile') or on_page('agency.invite') or on_page('agency.co-worker') , ' active') }}" href="#navbar-company" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-examples">
                            <i class="fas fa-landmark"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.company') }}</span>
                        </a>
                        <div class="collapse" id="navbar-company">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('agency.profile') }}">
                                            {{ __('sidebar_menu.company_profile') }}
                                    </a>
                                </li>
                                @if (owner())
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('agency.invite') }}">
                                            {{ __('sidebar_menu.invitation') }}
                                    </a>
                                </li>
                                @endif
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('agency.co-worker') }}">
                                            {{ __('sidebar_menu.co-worker') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    @endif
                    <!-- End company -->
                    @if(config('app.subscription') == 'on')
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('account.subscription.swap.index') or on_page('account.subscription.cancel.index') or on_page('account.subscription.invoice.index') or on_page('account.subscription.card.index') or on_page('account.subscription.team.index'), ' active') }}" href="#navbar-components" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-components">
                           <!-- <i class="ni ni-ui-04 text-info"></i> -->
                            <i class="fa fa-credit-card" aria-hidden="true"></i>
                            <span class="nav-link-text">
                                {{ __('sidebar_menu.subscription') }}
                                </span>
                        </a>
                        @subscribed
                        @notpiggybacksubscription
                        <!-- Subscription Links -->
                        <div class="collapse" id="navbar-components">
                            <ul class="nav nav-sm flex-column">
                                @subscriptionnotcancelled
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.subscription.swap.index'), ' active') }}"
                                        href="{{ route('account.subscription.swap.index') }}">
                                        {{ __('sidebar_menu.change_plan') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.subscription.cancel.index'), ' active') }}"
                                        href="{{ route('account.subscription.cancel.index') }}">
                                        {{ __('sidebar_menu.cancel_subscription') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.subscription.invoice.index'), ' active') }}"
                                        href="/account/subscription/invoice/invoices">
                                        {{ __('sidebar_menu.invoices') }}
                                    </a>
                                </li>
                                @endsubscriptionnotcancelled

                                @subscriptioncancelled
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.subscription.resume.index'), ' active') }}"
                                        href="{{ route('account.subscription.resume.index') }}">
                                        {{ __('sidebar_menu.resume_subscription') }}
                                    </a>
                                </li>
                                @endsubscriptioncancelled
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.subscription.card.index'), ' active') }}"
                                        href="{{ route('account.subscription.card.index') }}">
                                        {{ __('sidebar_menu.update_card') }}
                                    </a>
                                </li>
                                {{-- @teamsubscription
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.subscription.team.index'), ' active') }}"
                                        href="{{ route('account.subscription.team.index') }}">
                                        {{ __('sidebar_menu.manage_team') }}
                                    </a>
                                </li>
                                @endteamsubscription --}}
                            </ul>
                        </div>
                        @endnotpiggybacksubscription
                        @endsubscribed
                    </li>
                    @endif

                    @if(config('app.pricing_plan') == 'on')
                    @notsubscribed
                    <li class="nav-item">
                        <a class="nav-link {{ return_if(on_page('plans.index') or on_page('plans.teams.index'), ' active') }}" href="#navbar-plans" data-toggle="collapse" role="button"
                        aria-expanded="false" aria-controls="navbar-forms">
                            <i class="fas fa-dollar-sign"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.pricing_plan') }}</span>
                        </a>
                        <div class="collapse" id="navbar-plans">
                                <ul class="nav nav-sm flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link{{ return_if(on_page('plans.index'), ' active') }}"
                                            href="{{ route('plans.index') }}">
                                            <i class="far fa-user"></i>
                                            {{ __('sidebar_menu.user_plan') }}
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link{{ return_if(on_page('plans.teams.index'), ' active') }}"
                                    href="{{ route('plans.teams.index') }}">
                                            <i class="fas fa-users"></i>
                                            {{ __('sidebar_menu.team_plan') }}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                    </li>
                    @endnotsubscribed
                    @endif
                    <li class="nav-item">
                        <a class="nav-link{{ return_if(on_page('ticket.index') or on_page('ticket.create'), ' active') }}" href="#navbar-tickets" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-forms">
                            <i class="fas fa-ticket-alt"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.tickets') }}</span>
                        </a>
                        <div class="collapse" id="navbar-tickets">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('ticket.index'), ' active') }}"
                                        href="{{ route('ticket.index') }}">
                                        <i class="fas fa-clipboard-check"></i>
                                        {{ __('sidebar_menu.my_tickets') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('ticket.create'), ' active') }}"
                                        href="{{ route('ticket.create') }}">
                                        <i class="far fa-plus-square"></i>
                                        {{ __('sidebar_menu.new_ticket') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link{{ return_if(on_page('account.mynotification.index'), ' active') }}" href="#navbar-notifications" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-notifications">
                            <i class="fas fa-bell"></i>
                            <span class="nav-link-text">{{ __('sidebar_menu.notification') }}</span>
                        </a>
                        <div class="collapse" id="navbar-notifications">
                            <ul class="nav nav-sm flex-column">
                                <a class="nav-link{{ return_if(on_page('account.mynotification.index'), ' active') }}"
                                    href="{{ route('account.mynotification.index') }}">
                                    {{ __('sidebar_menu.notification') }}
                                </a>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link{{ return_if(on_page('agency.settings') or on_page('account.tokens.index') or on_page('developer.index'), ' active') }}" href="#settings" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="settings">
                            <i class="fas fa-cog"></i>
                            <span class="nav-link-text">
                                    {{ __('sidebar_menu.settings') }}</span>
                        </a>
                        <div class="collapse" id="settings">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('agency.settings'), ' active') }}"
                                        href="{{ route('agency.settings') }}">
                                        {{ __('sidebar_menu.company_settings') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('account.tokens.index'), ' active') }}"
                                        href="{{ route('account.tokens.index') }}">
                                        {{ __('sidebar_menu.api_token') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link{{ return_if(on_page('developer.index'), ' active') }}"
                                        href="{{ route('developer.index') }}">
                                        {{ __('sidebar_menu.developer_panel') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    
                </ul>
                
            </div>
        </div>
    </div>
</nav>