<article class="ya-contests ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <section>
                    <div>
                        <a href="" ng-click="change_view('month', 'competitions')">За Месяц</a>
                        <a href="" ng-click="change_view('agendaWeek', 'competitions')">За Неделю</a>
                        <a href="" ng-click="change_view('agendaDay', 'competitions')">За День</a>
                        <select name="" id="">
            				<option value="">По категориям</option>
            			</select>
                        <input type="text">
                    </div>
                    <div ui-calendar="calendarOptions" ng-model="eventSources" calendar="competitions"></div>
                    <div>
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
                </section>
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