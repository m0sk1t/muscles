<article class="ya-user ya-container ya-relative">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-4">
                <h3 class="ya-media-page__title ya-media-page__title_dialogs ya-title ya-relative ya-center">Управление</h3>
                <nav class="ya-nav-menu ya-nav-menu_manager">
                    <ul class="ya-nav-menu__list ya-nav-menu__list_manager">
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.managers" ng-class="{'ya-nav-menu__item_active': page === 'managers'}" ng-click="page = 'managers'; get_managers();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Менеджеры</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.users" ng-class="{'ya-nav-menu__item_active': page === 'users'}" ng-click="page = 'users'; get_users();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользователи</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.articles" ng-class="{'ya-nav-menu__item_active': page === 'articles'}" ng-click="page = 'articles'; get_articles();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Статьи</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.articles" ng-class="{'ya-nav-menu__item_active': page === 'themes'}" ng-click="page = 'themes'; get_themes();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Темы</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.contests" ng-class="{'ya-nav-menu__item_active': page === 'contests'}" ng-click="page = 'contests'; get_contests();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Конкурсы</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.competitions" ng-class="{'ya-nav-menu__item_active': page === 'competitions'}" ng-click="page = 'competitions'; get_competitions();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Соревнования</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.sports" ng-class="{'ya-nav-menu__item_active': page === 'sports'}" ng-click="page = 'sports'; get_sports();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Виды спорта</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.photos" ng-class="{'ya-nav-menu__item_active': page === 'photos'}" ng-click="page = 'photos'; get_photos();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользовательские фото</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.videos" ng-class="{'ya-nav-menu__item_active': page === 'videos'}" ng-click="page = 'videos'; get_videos();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользовательские видео</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.topics" ng-class="{'ya-nav-menu__item_active': page === 'topics'}" ng-click="page = 'topics'; get_topics();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Пользовательские объявления</span>
                        </li>
                        <li class="ya-nav-menu__item ya-nav-menu__item_manager" ng-show="manager.permission.hobbies" ng-class="{'ya-nav-menu__item_active': page === 'hobbies'}" ng-click="page = 'hobbies'; get_hobbies();">
                            <span class="ya-nav-menu__link ya-nav-menu__link_manager">Дополнительная информация</span>
                        </li>
                    </ul>
                </nav>

            </div>
            <div class="ya-grid-3-4">
                <section ng-show="page === 'managers'">
                    <h2 class="ya-media-page__title ya-relative">
                        Управление менеджерами
                        <span class="ya-albums__create-btn" ng-click="add_manager()"></span>
                    </h2>
                    <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="items.cred == null" ng-click="items.cred = null;">
                        <div class="ya-pop-up__wrapper">
                            <span class="ya-pop-up__close-btn" ng-click="items.cred = null;">X</span>
                            <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-3 ya-right">
                                            <label for="ya-log" class="ya-input__label">
                                                Логин
                                            </label>
                                        </div>
                                        <div class="ya-grid-2-3">
                                            <div class="ya-input__field-wrapper">
                                                <input id="ya-log" type="text" class="ya-input__field" placeholder="Логин" ng-model="items.cred.login">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-3 ya-right">
                                            <label for="ya-pwd" class="ya-input__label">
                                                Пароль
                                            </label>
                                        </div>
                                        <div class="ya-grid-2-3">
                                            <div class="ya-input__field-wrapper">
                                                <input id="ya-pwd" type="password" class="ya-input__field" placeholder="Пароль" ng-model="items.cred.password">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-2 ya-center">
                                            <button ng-click="create_manager()" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
                                        </div>
                                        <div class="ya-grid-1-2 ya-center">
                                            <button ng-click="items.cred = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-info-block" ng-repeat="m in managers track by $index" ng-hide="m.login==='m0sk1t'">
                        <div>
                            <div class="ya-info-block__content ya-manager">
                                <h3 class="ya-clearfix ya-manager__title"><b ng-if="m.login==='lex'">SuperUser:</b> {{m.login}} <a href="#" ng-hide="m.login==='lex'" ng-click="$event.preventDefault(); delete_manager(m._id, $index);" class="ya-del-btn">Удалить</a></h3>

                                <br />
                                <div class="ya-form">
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-users-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.users" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-users-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление пользователями
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-photo-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.photos" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-photo-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление фото
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-videos-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.videos" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-videos-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                     Управление видео
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-topics-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.topics" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-topics-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление объявлениями
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-articles-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.articles" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-articles-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление новостями
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-contests-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.contests" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-contests-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление конкурсами
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-sports-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.sports" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-sports-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление видами спорта
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-hobbies-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.hobbies" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-hobbies-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    permission.hobbies
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-managers-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.managers" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-managers-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление менеджерами
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-form__input ya-input ya-input_inline">
                                        <div class="ya-clearfix">
                                            <div class="ya-grid-1-1">
                                                <input type="checkbox" id="{{'ya-competitions-' + $index}}" class="ya-input__field ya-input__field_checkbox" ng-model="m.permission.competitions" ng-change="set_permission(m._id, $index);">
                                                <label for="{{'ya-competitions-' + $index}}" class="ya-input__label ya-input__label_checkbox">
                                                    Управление соревнованиями
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section ng-show="page === 'videos'">
                    <h2 class="ya-media-page__title ya-relative">
                        Управление видео
                    </h2>
                    <div class="ya-photos__list ya-photos__list_manager ya-clearfix" ng-show="videos && videos.length">
                        <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="v in videos track by $index">
                            <div class="ya-photos__wrapper">
                                <div class="ya-photos__img ya-photos__img_large" ng-style="{'background-image':'url(' + v.thumbnail + ')'}" title="{{p.title}}"></div>
                                <div class="ya-photos__actions">
                                    <a href="#/manage/user/{{v.owner}}" target="_blank" class="ya-photos__action-btn"><span class=" fa fa-user" title="Посмотреть профиль пользователя" ></span></a>
                                    <span class="ya-photos__action-btn fa fa-close" ng-click="delete_video(v._id, $index)"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section ng-show="page === 'photos'">
                    <h2 class="ya-media-page__title ya-relative">
                        Управление фото
                    </h2>
                    <div class="ya-photos__list ya-photos__list_manager ya-clearfix" ng-show="photos && photos.length">
                        <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="p in photos track by $index">
                            <div class="ya-photos__wrapper">
                                <div class="ya-photos__img ya-photos__img_large" ng-style="{'background-image':'url(' + p.image + ')'}" title="{{p.title}}"></div>
                                <div class="ya-photos__actions">
                                    <a href="#/manage/user/{{p.owner}}" target="_blank" class="ya-photos__action-btn"><span class=" fa fa-user" title="Посмотреть профиль пользователя" ></span></a>
                                    <span class="ya-photos__action-btn fa fa-close" title="Удалить" ng-click="delete_photo(p._id, $index)"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section ng-show="page === 'users'">
                    <h2 class="ya-media-page__title ya-relative">
                        Управление пользователями
                    </h2>
                    <div class="ya-photos__list ya-photos__list_manager ya-clearfix" ng-show="users && users.length">
                        <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="user in users track by $index">
                            <div class="ya-photos__wrapper">
                                <div class="ya-photos__img ya-photos__img_large" ng-style="{'background-image':'url(' + (user.avatar || '/images/avatar.jpg') + ')'}" title="{{user.name + ' ' + user.surname}}"></div>
                                <div class="ya-photos__actions">
                                    <a href="#/manage/user/{{user._id}}" target="_blank" class="ya-photos__action-btn"><span class=" fa fa-user" title="Посмотреть профиль пользователя" ></span></a>
                                    <span class="ya-photos__action-btn fa fa-close" title="Удалить" ng-click="delete_user(user._id, $index)"></span>
                                </div>
                            </div>
                            <div class="ya-photos__user-name">{{user.name + ' ' + user.surname}}</div>
                        </div>
                    </div>
                </section>
                <section ng-show="page === 'topics'" style="flex: 3; overflow-y: auto;">
                    <div ng-repeat="topic in topics track by $index">
                        <span style="background-color: #666" ng-click="delete_topic(topic._id, $index)">DEL</span>{{topic.text}}
                    </div>
                </section>
                <section ng-show="page === 'articles'">
                    <h2 class="ya-media-page__title ya-relative">
                        Управление статьями
                        <span class="ya-albums__create-btn" ng-click="create_article();"></span>
                    </h2>

                    <div class="ya-info-block ya-info-block_article" ng-repeat="article in articles track by $index">
                        <div class="ya-info-block__content ya-manager">
                            <h3 class="ya-clearfix ya-manager__title"><a href="#/manage/article/{{article._id}}">{{article.title}}</a> <a href="#" ng-click="$event.preventDefault(); delete_article(article._id, $index)" class="ya-del-btn">Удалить</a></h3>
                            <div class="ya-info-block__thumb-text" ng-bind-html="article_html(article.description)">
                            </div>
                            <div class="ya-right ya-clearfix ya-manager__actions">
                                <a href="#/manage/article/{{article._id}}" class="ya-btn ya-btn_small">Редактировать</a>
                                <a href="#" ng-click="$event.preventDefault(); delete_article(article._id, $index)" class="ya-btn ya-btn_secondary ya-btn_small">Удалить</a>
                            </div>
                        </div>
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
                <section ng-show="page === 'themes'">
                    <h2 class="ya-media-page__title ya-relative">
                        Управление темами
                        <span class="ya-albums__create-btn" ng-click="add_theme()"></span>
                    </h2>
                    <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="items.theme == null" ng-click="items.theme = null;">
                        <div class="ya-pop-up__wrapper">
                            <span class="ya-pop-up__close-btn" ng-click="items.theme = null;">X</span>
                            <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-3 ya-right">
                                            <label for="ya-theme" class="ya-input__label">
                                                Название темы
                                            </label>
                                        </div>
                                        <div class="ya-grid-2-3">
                                            <div class="ya-input__field-wrapper">
                                                <input id="ya-theme" type="text" class="ya-input__field" placeholder="Название темы " ng-model="items.theme.title">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ya-form__input ya-input ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-2 ya-center">
                                            <button ng-click="create_theme();" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
                                        </div>
                                        <div class="ya-grid-1-2 ya-center">
                                            <button ng-click="items.theme = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="ya-info-block ya-info-block_lined ya-clearfix" ng-repeat="theme in themes track by $index">
                        {{theme.title}} <span class="ya-del-btn ya-del-btn_lined" ng-click="delete_theme(theme._id, $index)">Удалить</span>
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