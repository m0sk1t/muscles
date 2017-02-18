<article class="ya-user ya-container ya-relative">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-4">
                <h3 class="ya-media-page__title ya-media-page__title_dialogs ya-title ya-relative ya-center">Управление</h3>
                <nav class="ya-nav-menu ya-nav-menu_manager">
                    <ul class="ya-nav-menu__list ya-nav-menu__list_manager">
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.managers" ng-class="{'ya-nav-menu__item_active': page === 'managers'}" ng-click="page = 'managers'; get_managers();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Менеджерами</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.users" ng-class="{'ya-nav-menu__item_active': page === 'users'}" ng-click="page = 'users'; get_users();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользователями</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.articles" ng-class="{'ya-nav-menu__item_active': page === 'articles'}" ng-click="page = 'articles'; get_articles();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Статьями</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.articles" ng-class="{'ya-nav-menu__item_active': page === 'themes'}" ng-click="page = 'themes'; get_themes();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Темами</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.contests" ng-class="{'ya-nav-menu__item_active': page === 'contests'}" ng-click="page = 'contests'; get_contests();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Конкурсами</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.competitions" ng-class="{'ya-nav-menu__item_active': page === 'competitions'}" ng-click="page = 'competitions'; get_competitions();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Соревнованиями</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.sports" ng-class="{'ya-nav-menu__item_active': page === 'sports'}" ng-click="page = 'sports'; get_sports();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Видами спорта</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.photos" ng-class="{'ya-nav-menu__item_active': page === 'photos'}" ng-click="page = 'photos'; get_photos();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользовательскими фото</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.videos" ng-class="{'ya-nav-menu__item_active': page === 'videos'}" ng-click="page = 'videos'; get_videos();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользовательскими видео</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.topics" ng-class="{'ya-nav-menu__item_active': page === 'topics'}" ng-click="page = 'topics'; get_topics();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользовательскими объявлениями</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.hobbies" ng-class="{'ya-nav-menu__item_active': page === 'hobbies'}" ng-click="page = 'hobbies'; get_hobbies();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Дополнительной информацией</span>
                        </li>
                    </ul>
                </nav>

            </div>
            <div class="ya-grid-3-4">
                <section ng-show="page === 'managers'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="add_manager()">Add</button>
                    <div ng-show="items.cred">
                        <input placeholder="Логин" type="text" ng-model="items.cred.login"><br />
                        <input placeholder="Пароль" type="password" ng-model="items.cred.password"><br />
                        <input type="button" value="Save" ng-click="create_manager()"><br />
                        <input type="button" value="Cancel" ng-click="items.cred = null;"><br />
                    </div>
                    <div ng-repeat="m in managers track by $index" ng-hide="m.login==='m0sk1t'">
                        <span ng-hide="m.login==='lex'" ng-click="delete_manager(m._id, $index);" style="background-color: #666;">DEL</span> <b ng-if="m.login==='lex'">superuser:</b> {{m.login}}
                        <br />
                        <span>
                            permission.users: <input type="checkbox" ng-model="m.permission.users" ng-change="set_permission(m._id, $index);"><br />
                            permission.photos: <input type="checkbox" ng-model="m.permission.photos" ng-change="set_permission(m._id, $index);"><br />
                            permission.videos: <input type="checkbox" ng-model="m.permission.videos" ng-change="set_permission(m._id, $index);"><br />
                            permission.topics: <input type="checkbox" ng-model="m.permission.topics" ng-change="set_permission(m._id, $index);"><br />
                            permission.articles: <input type="checkbox" ng-model="m.permission.articles" ng-change="set_permission(m._id, $index);"><br />
                            permission.contests: <input type="checkbox" ng-model="m.permission.contests" ng-change="set_permission(m._id, $index);"><br />
                            permission.sports: <input type="checkbox" ng-model="m.permission.sports" ng-change="set_permission(m._id, $index);"><br />
                            permission.hobbies: <input type="checkbox" ng-model="m.permission.hobbies" ng-change="set_permission(m._id, $index);"><br />
                            permission.managers: <input type="checkbox" ng-model="m.permission.managers" ng-change="set_permission(m._id, $index);"><br />
                            permission.competitions: <input type="checkbox" ng-model="m.permission.competitions" ng-change="set_permission(m._id, $index);"><br />
                        </span>
                    </div>
                </section>
                <section ng-show="page === 'videos'" style="display: flex; flex-wrap: wrap; flex: 3; overflow-y: auto;">
                    <div ng-repeat="video in videos track by $index" style="width: 10%">
                        <span style="background-color: #666" ng-click="delete_video(video._id, $index)">DEL</span>{{video.title}}
                        <a href="#/manage/user/{{video.owner}}" target="_blank">Посмотреть профиль пользователя</a>
                        <img ng-src="{{video.thumbnail}}">
                    </div>
                </section>
                <section ng-show="page === 'photos'" style="display: flex; flex-wrap: wrap; flex: 3; overflow-y: auto;">
                    <div ng-repeat="photo in photos track by $index" style="width: 10%">
                        <span style="background-color: #666" ng-click="delete_photo(photo._id, $index)">DEL</span>{{photo.title}}
                        <a href="#/manage/user/{{photo.owner}}" target="_blank">Посмотреть профиль пользователя</a>
                        <img ng-src="{{photo.image}}">
                    </div>
                </section>
                <section ng-show="page === 'users'" style="flex: 3; overflow-y: auto;">
                    <div ng-repeat="user in users track by $index" style="width: 10%">
                        <span style="background-color: #666" ng-click="delete_user(user._id, $index)">DEL</span>
                        <a href="#/manage/user/{{user._id}}" target="_blank">EDIT</a>{{user.name + ' ' + user.surname}}
                        <img ng-src="{{user.avatar || '/images/avatar.jpg'}}">
                    </div>
                </section>
                <section ng-show="page === 'topics'" style="flex: 3; overflow-y: auto;">
                    <div ng-repeat="topic in topics track by $index">
                        <span style="background-color: #666" ng-click="delete_topic(topic._id, $index)">DEL</span>{{topic.text}}
                    </div>
                </section>
                <section ng-show="page === 'articles'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="create_article();">Add</button>
                    <div ng-repeat="article in articles track by $index">
                        <span style="background-color: #666" ng-click="delete_article(article._id, $index)">DEL</span>
                        <a href="#/manage/article/{{article._id}}">EDIT</a><br />
                        <h3>{{article.title}}</h3>
                        <div ng-bind-html="article_html(article.text)">
                        </div>
                </section>
                <section ng-show="page === 'contests'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="create_contest();">Add</button>
                    <div ng-repeat="contest in contests track by $index">
                        <span style="background-color: #666" ng-click="delete_contest(contest._id, $index)">DEL</span>
                        <a href="#/manage/contest/{{contest._id}}">EDIT</a><br /> {{contest.title}}
                    </div>
                </section>
                <section ng-show="page === 'hobbies'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="add_hobbie()">Add</button>
                    <div ng-show="items.hobbie">
                        Тип информации
                        <select ng-model="items.hobbie.type">
                            <option ng-value="0">Доп. инфо</option>
                            <option ng-value="1">Работа</option>
                        </select><br>
                        <input ng-model="items.hobbie.item" placeholder="Название"><br>
                        <input type="button" value="Save" ng-click="create_hobbie();"><br>
                        <input type="button" value="Cancel" ng-click="items.hobbie = null;"><br />
                    </div>
                    <div ng-repeat="hobbie in hobbies track by $index">
                        <span style="background-color: #666" ng-click="delete_hobbie(hobbie._id, $index)">DEL</span> {{hobbie.item}}
                    </div>
                </section>
                <section ng-show="page === 'sports'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="add_sport()">Add</button>
                    <div ng-show="items.sport">
                        Вид спорта
                        <select ng-model="items.sport.sex">
                            <option ng-value="0">Женский</option>
                            <option ng-value="1">Мужской</option>
                        </select><br>
                        <input ng-model="items.sport.sport" placeholder="Название"><br>
                        <input type="button" value="Save" ng-click="create_sport();"><br>
                        <input type="button" value="Cancel" ng-click="items.sport = null;"><br />
                    </div>
                    <div ng-repeat="sport in sports track by $index">
                        <span style="background-color: #666" ng-click="delete_sport(sport._id, $index)">DEL</span> {{sport.sport}}
                    </div>
                </section>
                <section ng-show="page === 'themes'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="add_theme()">Add</button>
                    <div ng-show="items.theme">
                        <input ng-model="items.theme.title" placeholder="Название"><br>
                        <input type="button" value="Save" ng-click="create_theme();"><br>
                        <input type="button" value="Cancel" ng-click="items.theme = null;"><br />
                    </div>
                    <div ng-repeat="theme in themes track by $index">
                        <span style="background-color: #666" ng-click="delete_theme(theme._id, $index)">DEL</span> {{theme.title}}
                    </div>
                </section>
                <section ng-show="page === 'competitions'" style="flex: 3; overflow-y: auto;">
                    <button ng-click="create_competition()">Add</button>
                    <div ng-repeat="competition in competitions track by $index">
                        <span style="background-color: #666" ng-click="delete_competition(competition._id, $index)">DEL</span>
                        <a href="#/manage/competition/{{competition._id}}">EDIT</a> {{competition.title}}
                    </div>
                </section>
            </div>
        </div>
    </div>
</article>