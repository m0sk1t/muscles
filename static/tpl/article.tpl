<article class="ya-articles-page ya-container">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-article ya-articles">
                    <h2 class="ya-media-page__title ya-title ya-relative">
                        Новости в мире спорта
                    </h2>
                    <div class="ya-articles__filter ya-hr ya-clearfix">
                        <div class="ya-grid-1-2">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-3 ya-right">
                                    <label for="ya-sport" class="ya-input__label ya-input__label_big">
										Вид спорта
									</label>
                                </div>
                                <div class="ya-grid-2-3">
                                    <div class="ya-input__field-wrapper">
                                        <select id="ya-sport" class="ya-input__field ya-input__field_select ya-input__select">
											<option value=""></option>
											<option value="Спорт 1">Спорт 1</option>
											<option value="Спорт 2">Спорт 2</option>
										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-grid-1-2">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-3 ya-right">
                                    <label for="ya-theme" class="ya-input__label ya-input__label_big">
										Тематика
									</label>
                                </div>
                                <div class="ya-grid-2-3">
                                    <div class="ya-input__field-wrapper">
                                        <select id="ya-theme" class="ya-input__field ya-input__field_select ya-input__select">
											<option value=""></option>
											<option value="Тема 1">Тема 1</option>
											<option value="Тема 2">Тема 2</option>
										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-articles__subtitle">
                        Последние добавленные
                    </div>
                    <div class="ya-article__item">
                        <div class="ya-bordered-box">
                            <div class="ya-articles__content ya-article__content">
                                <h3 class="ya-articles__title ya-article__title">{{article.title}}</h3>
                                <div class="ya-articles__date ya-article__date">
                                    07.07.2016
                                </div>
                                <div class="ya-articles__desc">
                                    {{article_html(article.text)}}
                                </div>
                                <div class="ya-article__social-share ya-share-box">
                                    <span class="ya-share-box__title">Поделиться в </span>
                                    <span class="ya-share-box__btns">
										<a href="#" class="ya-share-box__btn ya-share-box__btn_vk"></a>
										<a href="#" class="ya-share-box__btn ya-share-box__btn_fb"></a>
										<a href="#" class="ya-share-box__btn ya-share-box__btn_ok"></a>
										<a href="#" class="ya-share-box__btn ya-share-box__btn_tw"></a>
									</span>
                                </div>
                                <div class="ya-article__nav ya-clearfix">
                                    <div class="ya-row">
                                        <div class="ya-article__nav-btn ya-grid-1-2 ya-article__nav-btn_prev">
                                            <div class="ya-relative ya-article__nav-btn-wrapper">
                                                <div class="ya-article__nav-btn-title ya-article__nav-btn-title_main">Предыдущая новость</div>
                                                <div class="ya-article__nav-btn-title_sub">Соревнования по бодибилдингу в г. Пенза</div>
                                                <a href="#" class="ya-article__btn-link ya-article__btn-link_prev">
                                                    <</a>
                                            </div>
                                        </div>
                                        <div class="ya-article__nav-btn ya-grid-1-2 ya-article__nav-btn_next">
                                            <div class="ya-relative ya-article__nav-btn-wrapper ya-article__nav-btn-wrapper_next">
                                                <div class="ya-article__nav-btn-title ya-article__nav-btn-title_main ya-right">Следующая новость</div>
                                                <div class="ya-article__nav-btn-title_sub ya-right">Соревнования по бодибилдингу в г. Пенза</div>
                                                <a href="#" class="ya-article__btn-link ya-article__btn-link_next">></a>
                                            </div>
                                        </div>
                                    </div>
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
                                        <div class="ya-comments__item">
                                            <div class="ya-wall__news-author ya-relative ya-clearfix">
                                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                    <img ng-src="{{'/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                </div>
                                                <div class="ya-wall__news-info">
                                                    <div class="ya-wall__author-name">
                                                        Иван Иванов
                                                    </div>
                                                    <div class="ya-wall__news-date">
                                                        07.07.2016
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ya-wall__news-text">
                                                <pre>Новый комментарий от какого-то пользователя.</pre>
                                            </div>
                                        </div>
                                    </div>
                                    <form class="ya-comments__add-form ya-input">
                                        <input type="text" placeholder="Комментировать" class="ya-comments__add-field ya-input__field">
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
