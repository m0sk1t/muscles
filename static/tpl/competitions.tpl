<article class="ya-competitions-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-competitions">
                    <h2 class="ya-media-page__title ya-relative">
                        Расписание соревнований
                    </h2>
                    <div class="ya-articles__filter ya-hr ya-clearfix">
                        <div class="ya-grid-1-3">
                            <a href="" ng-click="change_view('month', 'competitions')" class="ya-competitions__link ya-competitions__link_active">За Месяц</a>
                            <a href="" ng-click="change_view('agendaWeek', 'competitions')" class="ya-competitions__link">За Неделю</a>
                            <a href="" ng-click="change_view('agendaDay', 'competitions')" class="ya-competitions__link">За День</a>
                        </div>
                        <div class="ya-grid-1-3">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-1">
                                    <div class="ya-input__field-wrapper">
                                        <select id="ya-theme" class="ya-input__field ya-input__field_select ya-input__select" ng-model="sport">
                                            <option value="" ng-repeat="s in sports">{{s.sport}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-grid-1-3">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-1">
                                    <div class="ya-input__field-wrapper">
                                        <input type="text" class="ya-input__field" placeholder="Поиск">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-competitions__content ya-articles ya-articles_competitions">
                        <div class="ya-competitions__calendar">
                            <div ui-calendar="calendarOptions" ng-model="eventSources" calendar="competitions"></div>
                        </div>
                        <div class="ya-articles__subtitle">
                            Ближайшие соревнования
                        </div>
                        <div class="ya-articles__list">
                            <div class="ya-articles__item" ng-repeat="c in competitions">
                                <h3 class="ya-articles__title">{{c.title}}</h3>
                                <div class="ya-bordered-box ya-bordered-box_left">
                                    <div class="ya-clearfix">
                                        <div class="ya-articles__media ya-grid-1-5">
                                            <img src="images/competition.png" alt="Alternative text" class="ya-articles__thumb">
                                        </div>
                                        <div class="ya-articles__content ya-grid-4-5">
                                            <div class="ya-articles__row ya-clearfix">
                                                <div class="ya-grid-1-5 ya-articles__row-title">
                                                    Дата
                                                </div>
                                                <div class="ya-grid-4-5 ya-articles__row-text">
                                                    {{c.start}}
                                                </div>
                                            </div>
                                            <div class="ya-articles__row ya-clearfix">
                                                <div class="ya-grid-1-5 ya-articles__row-title">
                                                    Страна
                                                </div>
                                                <div class="ya-grid-4-5 ya-articles__row-text">
                                                    {{c.country.title}}
                                                </div>
                                            </div>
                                            <div class="ya-articles__row ya-clearfix">
                                                <div class="ya-grid-1-5 ya-articles__row-title">
                                                    Город
                                                </div>
                                                <div class="ya-grid-4-5 ya-articles__row-text">
                                                    {{c.city.title}}
                                                </div>
                                            </div>
                                            <div class="ya-articles__row ya-clearfix">
                                                <div class="ya-grid-1-5 ya-articles__row-title">
                                                    Место
                                                </div>
                                                <div class="ya-grid-4-5 ya-articles__row-text">
                                                    {{c.place}}
                                                </div>
                                            </div>
                                            <div class="ya-articles__row ya-clearfix">
                                                <div class="ya-grid-1-5 ya-articles__row-title">
                                                    Номинация
                                                </div>
                                                <div class="ya-grid-4-5 ya-articles__row-text">
                                                    {{c.nomination}}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-articles__row-title ya-articles__row-title_desc">
                                        Описание
                                    </div>
                                    <div class="ya-articles__desc">
                                        {{c.description}}
                                    </div>
                                    <div class="ya-articles__readmore ya-right">
                                        <a href="#/competition/{{c._id}}" class="ya-btn ya-btn_primary ya-btn_inline">Читать дальше</a>
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
</article>