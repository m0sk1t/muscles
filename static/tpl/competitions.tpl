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
                                        <select id="ya-theme" class="ya-input__field ya-input__field_select ya-input__select">
                                            <option value="">По категориям</option>
                                            <option value="Тема 1">Тема 1</option>
                                            <option value="Тема 2">Тема 2</option>
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
                    <div class="ya-competitions__content">
                        <div class="ya-competitions__calendar">
                            <div ui-calendar="calendarOptions" ng-model="eventSources" calendar="competitions"></div>
                        </div>
                        <div class="ya-competitons__list">
                            <div ng-repeat="c in competitions">
                                <h3>{{c.title}}</h3>
                                <div>{{c.date}}</div>
                                <div>{{c.city}}</div>
                                <div>{{c.place}}</div>
                                <div>{{c.title}}</div>
                                <div>{{c.nomination}}</div>
                                <div>{{c.description}}</div>
                                <a href="#/competition/{{c._id}}">Подробнее</a>
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