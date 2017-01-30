<article class="ya-dialoges ya-container">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-3">
                <div class="ya-dialoges__penpals ya-penpals">
                    <h2 class="ya-media-page__title ya-media-page__title_dialogs ya-title ya-relative ya-center">
                        Список диалогов
                    </h2>
                    <div class="ya-penpals__list">
                        <div class="ya-penpals__item ya-clearfix" ng-repeat="d in dialogs track by $index" ng-click="set_messages(d, $index);">
                            <div class="ya-grid-1-5">
                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                    <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                </div>
                            </div>
                            <div class="ya-grid-4-5">
                                <div class="ya-penpals__title ya-clearfix">
                                    <div class="ya-penpals__name ya-grid-2-3 ya-left">
                                        {{with_user(d)}}
                                    </div>
                                    <div class="ya-penpals__date ya-grid-1-3 ya-right">
                                        21.01.2017
                                    </div>
                                </div>
                                <div class="ya-penpals__msg">
                                    {{d.messages[d.messages.length - 1].text}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ya-grid-7-15">
                <h2 class="ya-media-page__title ya-media-page__title_msgs ya-title ya-relative">
                    Иванов Иван
                </h2>
                <div class="ya-dialog ya-relative">
                    <div class="ya-dialog__content">
                        <div class="ya-wall">
                            <div class="ya-wall__news">
                                <div class="ya-wall__news-list">
                                    <!--div class="ya-wall__news-item">
										<div class="ya-wall__news-content">
											<div class="ya-wall__news-text">
												Пока не добавлено ни одного сообщения.
											</div>
										</div>
									</div-->
                                    <div class="ya-wall__news-item" ng-repeat="m in messages">
                                        <div class="ya-wall__news-content">
                                            <div class="ya-wall__news-author ya-relative ya-clearfix">
                                                <div class="ya-wall__news-remove" ng-if="options.user._id === user._id" ng-click="del_topic($index)">x</div>
                                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                    <img ng-src="{{m.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                </div>
                                                <div class="ya-wall__news-info ya-clearfix">
                                                    <div class="ya-wall__author-name">
                                                        {{m.fio}}
                                                    </div>
                                                    <div class="ya-wall__news-date">
                                                        {{m.date}}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ya-wall__news-text">
                                                <pre>{{m.text}}</pre>
                                            </div>
                                            <div class="ya-wall__news-media">
                                                <img ng-src="{{i}}" ng-repeat="i in m.images" class="ya-wall__news-img" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-wall__news-item">
                                        <div class="ya-wall__news-content">
                                            <div class="ya-wall__news-author ya-relative ya-clearfix">
                                                <div class="ya-wall__news-remove" ng-if="options.user._id === user._id" ng-click="del_topic($index)">x</div>
                                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                    <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                </div>
                                                <div class="ya-wall__news-info">
                                                    <div class="ya-wall__author-name">
                                                        Иванов Иван
                                                    </div>
                                                    <div class="ya-wall__news-date">
                                                        21.01.2017
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ya-wall__news-text">
                                                <pre>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi suscipit porttitor pellentesque. In tellus libero, ultrices ac sapien in, tempor consequat dui. Vivamus sem turpis, laoreet et aliquam et, auctor iaculis ex. Suspendisse tempor semper hendrerit. Morbi id pellentesque purus, a suscipit libero. Nam nec vulputate nisl, nec sodales dui. Praesent porttitor lacinia felis, ac sollicitudin tellus cursus et. Phasellus elementum diam vel eros viverra aliquet. Aliquam finibus vitae mi non faucibus. Nulla eget velit et sapien scelerisque varius. Nam tempus suscipit risus nec sodales. Cras id metus turpis.</pre>
                                            </div>
                                            <div class="ya-wall__news-media">
                                                <img ng-src="{{i}}" ng-repeat="i in t.images" class="ya-wall__news-img" />
                                            </div>
                                        </div>
                                    </div>
                                    <form ng-submit="add_message()" ng-show="messages.length">
                                        <input type="text" ng-model="message">
                                    </form>
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