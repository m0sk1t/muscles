<article class="ya-contests ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-contest">
                    <h2 class="ya-media-page__title ya-relative">
                        Конкурс {{contest.title}}
                        <span class="ya-contest__info">Об участии в конкурсе</span>
                    </h2>
                    <div class="ya-contest__content">
                        <div class="ya-contest__subtitle">Такое интересное соревнование. Вы просто обязаны в нем участвовать. {{contest.type}}</div>
                        <div class="ya-contest__timer">
                            <div class="ya-timer">
                                <div class="ya-timer__title">До окончания конкурса осталось:</div>
                                <div class="ya-timer__clock ya-clearfix">
                                    <div class="ya-grid-1-3">
                                        <div class="ya-timer__block ya-timer__block_days ya-clearfix">
                                            <div class="ya-span-1-2">
                                                <div class="ya-timer__digit">1</div>
                                            </div>
                                            <div class="ya-span-1-2">
                                                <div class="ya-timer__digit">2</div>
                                            </div>
                                        </div>
                                        <div class="ya-timer__label">
                                            дни
                                        </div>
                                    </div>
                                    <div class="ya-grid-1-3">
                                        <div class="ya-timer__block ya-timer__block_hours ya-clearfix">
                                            <div class="ya-span-1-2">
                                                <div class="ya-timer__digit">1</div>
                                            </div>
                                            <div class="ya-span-1-2">
                                                <div class="ya-timer__digit">9</div>
                                            </div>
                                        </div>
                                        <div class="ya-timer__label">
                                            часы
                                        </div>
                                    </div>
                                    <div class="ya-grid-1-3">
                                        <div class="ya-timer__block ya-timer__block_minutes ya-clearfix">
                                            <div class="ya-span-1-2">
                                                <div class="ya-timer__digit">5</div>
                                            </div>
                                            <div class="ya-span-1-2">
                                                <div class="ya-timer__digit">3</div>
                                            </div>
                                        </div>
                                        <div class="ya-timer__label">
                                            минуты
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-contest__icons ya-clearfix">
                            <div class="ya-grid-1-4">
                                <div class="ya-contest__icon ya-informer ya-informer_prize">
                                    <div class="ya-informer__title">
                                        Призовой фонд
                                    </div>
                                    <div class="ya-informer__content">
                                        256 000 {{contest.prize}} руб.
                                    </div>
                                </div>
                            </div>
                            <div class="ya-grid-1-4">
                                <div class="ya-contest__icon ya-informer ya-informer_looks">
                                    <div class="ya-informer__title">
                                        Просмотров
                                    </div>
                                    <div class="ya-informer__content">
                                        46 933
                                    </div>
                                </div>
                            </div>
                            <div class="ya-grid-1-4">
                                <div class="ya-contest__icon ya-informer ya-informer_votes">
                                    <div class="ya-informer__title">
                                        Всего голосов
                                    </div>
                                    <div class="ya-informer__content">
                                        {{count_free_likes()}}
                                    </div>
                                </div>
                            </div>
                            <div class="ya-grid-1-4">
                                <div class="ya-contest__icon ya-informer ya-informer_votes-payed">
                                    <div class="ya-informer__title">
                                        Платные голоса
                                    </div>
                                    <div class="ya-informer__content">
                                        {{count_paid_likes()}}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-contest__participants ya-participants ya-clearfix">
                            <div class="ya-grid-1-4" ng-repeat="p in contest.participants">
                                <div class="ya-participant">
                                    <div class="ya-participant__place ya-participant__place_1">
                                        1
                                    </div>
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
                            <div class="ya-grid-1-4">
                                <div class="ya-participant ya-participant_apply">
                                    <div class="ya-participant__place">
                                    </div>
                                    <div class="ya-participant__content">
                                        <div class="ya-participant__media">
                                            <div class="ya-participant__img ya-participant__img_text">
                                                Прояви себя!
                                            </div>
                                        </div>
                                        <div class="ya-participant__name ya-participant__name_take-part">

                                        </div>
                                    </div>
                                     <div class="ya-participant__actions">
                                            <span class="ya-participant__btn" ng-if="expired();" ng-click="participate()">{{contest.participants.indexOf(options.user._id) === -1? 'Участвовать в конкурсе': 'Отказаться от участия'}}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-contest__tabs">
                            <nav class="ya-nav-menu ya-nav-menu_view_buttons ya-nav-menu_view_participants ya-options__nav">
                                <ul class="ya-nav-menu__list ya-clearfix">
                                    <li class="ya-nav-menu__item">
                                        <span class="ya-nav-menu__link ya-nav-menu__link_all-participants">Все конкурсанты ({{contest.participants.length}})<span>
                                    </li>
                                    <li class="ya-nav-menu__item">
                                        <span class="ya-nav-menu__link ya-nav-menu__link_new-participants">Только новые ({{count_new_participants();}})<span>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="ya-contest__desc">
                            <h3 class="ya-contest__desc-title">Об участии в конкурсе</h3>
                            <div class="ya-contest__desc-content">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at dictum ante. Mauris non lacinia est. Phasellus ex est, efficitur ac pretium ut, lacinia ut nisi. Vestibulum sem elit, tincidunt in metus eget, eleifend tempus risus. In consequat scelerisque mi, a sagittis dolor. Praesent vestibulum lorem sapien, et iaculis quam vulputate feugiat. Maecenas tempor dolor at leo varius, lacinia porta magna maximus.</p>

                                <p>Pellentesque et elit vel dui viverra auctor. Phasellus sagittis pellentesque ipsum, ac facilisis magna euismod ut. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla in diam scelerisque, facilisis dolor a, egestas nisl. Nulla faucibus eget tellus eget luctus. Vivamus lorem elit, eleifend ac condimentum quis, interdum sit amet felis. Nulla a faucibus justo, quis iaculis elit.</p>
                                {{contest.description}}
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