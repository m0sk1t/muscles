<article class="ya-articles-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-article ya-articles">
                    <h2 class="ya-media-page__title ya-title ya-relative">
                        Соревнование {{competition.title}}
                    </h2>
                    <div class="ya-article__item">
                        <div class="ya-bordered-box ya-bordered-box_single">
                            <div class="ya-clearfix">
                                <div class="ya-articles__media ya-grid-1-5">
                                    <img src="images/competition.png" alt="Alternative text" class="ya-articles__thumb">
                                </div>
                                <div class="ya-articles__content ya-grid-4-5">
                                    <div class="ya-articles__row ya-clearfix">
                                        <div class="ya-grid-1-5 ya-articles__row-title">
                                            Время проведения
                                        </div>
                                        <div class="ya-grid-4-5 ya-articles__row-text">
                                            с {{format_date(competition.start)}} по {{format_date(competition.end)}}
                                        </div>
                                    </div>
                                    <div class="ya-articles__row ya-clearfix">
                                        <div class="ya-grid-1-5 ya-articles__row-title">
                                            Страна
                                        </div>
                                        <div class="ya-grid-4-5 ya-articles__row-text">
                                            {{competition.country.title}}
                                        </div>
                                    </div>
                                    <div class="ya-articles__row ya-clearfix">
                                        <div class="ya-grid-1-5 ya-articles__row-title">
                                            Город
                                        </div>
                                        <div class="ya-grid-4-5 ya-articles__row-text">
                                            {{competition.city.title}}
                                        </div>
                                    </div>
                                    <div class="ya-articles__row ya-clearfix">
                                        <div class="ya-grid-1-5 ya-articles__row-title">
                                            Место
                                        </div>
                                        <div class="ya-grid-4-5 ya-articles__row-text">
                                            {{competition.place}}
                                        </div>
                                    </div>
                                    <div class="ya-articles__row ya-clearfix">
                                        <div class="ya-grid-1-5 ya-articles__row-title">
                                            Номинация
                                        </div>
                                        <div class="ya-grid-4-5 ya-articles__row-text">
                                            {{competition.nomination}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-articles__row-title ya-articles__row-title_desc">
                                Описание
                            </div>
                            <div class="ya-articles__desc">
                                {{competition.description}}
                            </div>
                            <div class="ya-articles__content ya-article__content">
                                <div class="ya-article__social-share ya-share-box">
                                    <span class="ya-share-box__title">Поделиться в </span>
                                    <span class="ya-share-box__btns">
                                        <a href="#" class="ya-share-box__btn ya-share-box__btn_vk"></a>
                                        <a href="#" class="ya-share-box__btn ya-share-box__btn_fb"></a>
                                        <a href="#" class="ya-share-box__btn ya-share-box__btn_ok"></a>
                                        <a href="#" class="ya-share-box__btn ya-share-box__btn_tw"></a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="ya-bordered-box ya-bordered-box_first_false">
                            <div class="ya-article__comments">
                                <div class="ya-article__comments-title">
                                    Ваши комментарии
                                </div>
                                <div class="ya-comments ya-comments_article ya-wall">
                                    <div class="ya-comments__list">
                                        <div class="ya-comments__item" ng-repeat="c in competition.comments">
                                            <div class="ya-wall__news-author ya-relative ya-clearfix">
                                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                    <img ng-src="{{c.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                </div>
                                                <div class="ya-wall__news-info">
                                                    <div class="ya-wall__author-name">
                                                        {{c.name}} {{c.surname}}
                                                    </div>
                                                    <div class="ya-wall__news-date">
                                                        {{c.date}}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ya-wall__news-text">
                                                <pre>{{c.comment}}</pre>
                                            </div>
                                        </div>
                                    </div>
                                    <form class="ya-comments__add-form ya-input" ng-submit="add_comment();">
                                        <input type="text" ng-model="comment" placeholder="Комментировать" class="ya-comments__add-field ya-input__field">
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