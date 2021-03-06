<article class="ya-articles-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-articles">
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
                                        <select id="ya-sport" class="ya-input__field ya-input__field_select ya-input__select" ng-model="sport">
                                            <option value=""></option>
											<option ng-repeat="s in sports">{{s.sport}}</option>
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
                                        <select id="ya-theme" class="ya-input__field ya-input__field_select ya-input__select" ng-model="theme">
                                            <option value=""></option>
											<option ng-repeat="t in themes">{{t.title}}</option>
										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-articles__subtitle">
                        Последние добавленные
                    </div>
                    <div class="ya-articles__list">
                        <div class="ya-articles__item" ng-repeat="i in articles | filter:sport track by $index">
                            <div class="ya-bordered-box">
                                <div class="ya-clearfix">
                                    <div class="ya-articles__media ya-grid-2-5">
                                        <img ng-src="{{get_picture($index) || 'images/article-thumb.jpg'}}" alt="Alternative text" class="ya-articles__thumb">
                                    </div>
                                    <div class="ya-articles__content ya-grid-3-5">
                                        <h3 class="ya-articles__title">{{i.title}}</h3>
                                        <div class="ya-articles__desc">
                                            {{i.description}}
                                        </div>
                                        <div class="ya-articles__readmore">
                                            <a href="#/article/{{i._id}}" class="ya-btn ya-btn_primary ya-btn_inline">Читать дальше</a>
                                        </div>
                                        <div class="ya-articles__date">
                                            {{format_date(i.creDate)}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--div class="ya-articles__pagination ya-pagination ya-center">
                        <ul class="ya-pagination__list ya-clearfix">
                            <li class="ya-pagination__item ya-pagination__item_hidden">
                                <a href="#" class="ya-pagination__link ya-pagination__link_box ya-pagination__link_prev">
                                    < </a>
                            </li>
                            <li class="ya-pagination__item ya-pagination__item_active">
                                <a href="#" class="ya-pagination__link ya-pagination__link_active">
									1
								</a>
                            </li>
                            <li class="ya-pagination__item">
                                <a href="#" class="ya-pagination__link">
									2
								</a>
                            </li>
                            <li class="ya-pagination__item">
                                <a href="#" class="ya-pagination__link">
									3
								</a>
                            </li>
                            <li class="ya-pagination__item">
                                <a href="#" class="ya-pagination__link">
									4
								</a>
                            </li>
                            <li class="ya-pagination__item">
                                <a href="#" class="ya-pagination__link">
									5
								</a>
                            </li>
                            <li class="ya-pagination__item">
                                <a href="#" class="ya-pagination__link ya-pagination__link_box ya-pagination__link_next">
									>
								</a>
                            </li>
                        </ul>
                    </div-->
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