<header class="i_modular_menu header_area">
    <div class="main_header_area">
        <div class="container">
            <nav class="navigation d-flex align-items-center flex-column">
                <div class="d-flex justify-content-between align-items-center w-100 mt-4">
                    <div class="nav-header">
                        <a class="d-flex" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img alt="{$obj->Title_head()}" src="project_files/images/logo.png"/>
                        </a>
                    </div>
                    <div class="box_button_header">
                        <a class="button_header logIn d-flex d-lg-none" href="javascript:"><i>
                                <svg viewbox="0 0 448 512">
                                    <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM224 32c52.94 0 96 43.06 96 96c0 52.93-43.06 96-96 96S128 180.9 128 128C128 75.06 171.1 32 224 32zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM413.3 480H34.66C33.2 480 32 478.8 32 477.3C32 399.4 95.4 336 173.3 336h101.3C352.6 336 416 399.4 416 477.3C416 478.8 414.8 480 413.3 480z"></path>
                                </svg>
                            </i><span>
                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}
                            </span></a>
                        <a class="button_header_phone d-none d-lg-flex" href="javascript:">
                            <span>09120517308</span>
                            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M384 80c8.8 0 16 7.2 16 16V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V96c0-8.8 7.2-16 16-16H384zm64 16c0-35.3-28.7-64-64-64H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96zM293.3 128.7c-9.7-2.6-19.9 2.3-23.7 11.6l-20 48c-3.4 8.2-1 17.6 5.8 23.2L280 231.7c-16.6 35.2-45.1 63.7-80.3 80.3l-20.2-24.7c-5.6-6.8-15-9.2-23.2-5.8l-48 20c-9.3 3.9-14.2 14-11.6 23.7l12 44C111.1 378 119 384 128 384c123.7 0 224-100.3 224-224c0-9-6-16.9-14.7-19.3l-44-12z"></path></svg>
                        </a>
                    </div>
                    <div class="nav-toggle mr-3">
                        <svg viewbox="0 0 448 512">
                            <path d="M0 80C0 71.16 7.164 64 16 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H16C7.164 96 0 88.84 0 80zM0 240C0 231.2 7.164 224 16 224H432C440.8 224 448 231.2 448 240C448 248.8 440.8 256 432 256H16C7.164 256 0 248.8 0 240zM432 416H16C7.164 416 0 408.8 0 400C0 391.2 7.164 384 16 384H432C440.8 384 448 391.2 448 400C448 408.8 440.8 416 432 416z"></path>
                        </svg>
                    </div>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">flight</a></li>
                        <li class="d-block d-lg-none"><a href="javascript:">Ranking path</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">Blog</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/orderServices">Tourism services</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutIran">info of Iran</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">Iran hotels</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/iranVisa">iran visa</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/tour">tour</a></li>
                        <li><a href="javascript:">Our agency</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">Order Tracking</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/faq">Terms and conditions</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/clock">world clock</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">about us</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">call us</a></li>
                            </ul>
                        </li>
                        <li class="d-none d-lg-flex">
                            <a class='main-navigation__button2 show-box-login-js' href="javascript:">
                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}
                            </a></li>
                    </ul>
                </div>
                <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                    {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}
                </div>
            </nav>
        </div>
    </div>
</header>