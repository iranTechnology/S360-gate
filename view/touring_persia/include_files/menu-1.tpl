<header class="i_modular_menu header_area fixedmenu">
    <div class="main_header_area animated" id="navigation1">
        <div class="top-menu">
            <div class="container">
                <div class="parent-top-menu">
                    <div class="nav-header">
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img alt="{$obj->Title_head()}" src="project_files/images/logo.png"/>
                        </a>
                    </div>
                    <div class="parent-data-header">
                        <div class="nav-email">
                            <a class="btn-link-header" href="mailto:{$smarty.const.CLIENT_EMAIL}">
                                <span>{$smarty.const.CLIENT_EMAIL}</span>
                                <i class="fa-light fa-envelope"></i>
                            </a>
                        </div>
                        <div class="nav-phone">
                            <a class="btn-link-header" href="https://wa.me/{$smarty.const.CLIENT_MOBILE}">
                                <span>{$smarty.const.CLIENT_MOBILE}</span>
                                <i class="fa-brands fa-whatsapp"></i>
                            </a>
                        </div>
                        <dv class='nav-user'>
                            <a href='javascript:' class='main-navigation__button2 btn-link-header'>
                                <span>
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`touring_persia/topBarName.tpl"}
                                </span>
                                <i class="fa-regular fa-user"></i>
                            </a>
                            <div class="main-navigation__sub-menu2 arrow-up p-0">

                                {include file="`$smarty.const.FRONT_THEMES_DIR`touring_persia/topBar.tpl"}

                            </div>
                        </dv>
                        <div class="nav-toggle"></div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navigation">
            <div class="container">
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu align-to-right">
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">Iran Tour</a>
                        </li>
                        <li>
                            <a href="javascript:">Iran Visa</a>
                            <ul class="nav-dropdown nav-submenu">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Information">Information </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/iranVisa"> Apply for visa </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/embassies">Iran embassies</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a onclick="clickScroll('Inspire-me')" href="javascript:">Inspire me</a>
                            <ul class="nav-dropdown nav-submenu">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Destinations">Destinations</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/mag"> Articles</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/recommendation">Travelogue</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/PersianFood">Persian food</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a onclick="clickScroll('Problems-solve')" href="javascript:">Problems we solve</a>
                            <ul class="nav-dropdown nav-submenu">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">Hotels  </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Transportation"> Transportation  </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/visa">Visa  </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Food">Food  </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Outfit">Outfit  </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Tourist">Tourist   </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/faq">FAQ</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/Guide">Guide</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a onclick="clickScroll('contact-us')" href="javascript:">contact us</a>
                        </li>
                        <li>
                            <a href="javascript:">About us</a>
                            <ul class="nav-dropdown nav-submenu">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/video">Traveler's  video's </a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">Track order </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>