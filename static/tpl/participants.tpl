<article class="ya-contests ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-contest">
                    <h2 class="ya-media-page__title ya-relative">
                        Конкурс {{contest.title}} / Конкурсанты
                        <span class="ya-contest__info">Об участии в конкурсе</span>
                    </h2>
                    <div class="ya-contest__content">
                        <div class="ya-contest__tabs">
                            <nav class="ya-nav-menu ya-nav-menu_view_buttons ya-nav-menu_no-pad ya-nav-menu_view_participants ya-options__nav">
                                <ul class="ya-nav-menu__list ya-clearfix">
                                    <li class="ya-nav-menu__item">
                                        <span class="ya-nav-menu__link ya-nav-menu__link_all-participants">Все конкурсанты (21)<span>
                                    </li>
                                    <li class="ya-nav-menu__item">
                                        <span class="ya-nav-menu__link ya-nav-menu__link_new-participants">Только новые (20)<span>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="ya-contest__participants ya-participants ya-clearfix">
                            <div class="ya-grid-1-4" ng-repeat="p in contest.participants">
                                <div class="ya-participant ya-participant_listed">
                                    <div class="ya-participant__content ya-relative">
                                        <div class="ya-participant__media">
                                            <div class="ya-participant__img" ng-style="{'background-image':'url(' + (p.avatar ? p.avatar : '/images/avatar.jpg') + ')'}"></div>
                                        </div>
                                        <div class="ya-participant__name">
                                            Иван {{p.name}}
                                        </div>
                                        <a href="#/user/{{p.id}}" class="ya-participant__link"></a>
                                    </div>
                                    <div class="ya-participant__actions ya-clearfix">
                                        <div class="ya-span-2-3">
                                            <div class="ya-participant__votes">
                                                556 (+9)
                                            </div>
                                        </div>
                                        <div class="ya-span-1-3">
                                            <div class="ya-participant__like">
                                                <!--span ng-if="p.likes.paid.indexOf(options.user._id) === -1" ng-click="add_paid_like(p.id)">
                                                    PLike
                                                </span-->
                                                <span  class="ya-participant__vote" ng-if="p.likes.free.indexOf(options.user._id) === -1" ng-click="add_free_like(p.id)">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ya-grid-1-5">
                <div class="ya-page__block">
                    <!--div class="ya-btn ya-btn_search"-->
                    <a href="#/search" class="ya-btn__link ya-btn__link_search">Поиск</a>
                    <!--/div-->
                </div>
                <user-links-block class="ya-page__block ya-page__block_colored"></user-links-block>
                <ads-block class="ya-page__block ya-page__block_colored"></ads-block>
            </div>
        </div>
    </div>
</article>