<article class="ya-search-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-4">
                <a href="#" ng-click="$event.preventDefault();showsidebar = !showsidebar;" class="ya-sidebar-info__mobile-link ya-center ya-btn ya-btn_primary" ng-class="{'ya-sidebar-info__mobile-link_active': showsidebar}">
              Параметры поиска
            </a>
                <div class="ya-sidebar-info__full-wrap" ng-class="{'ya-sidebar-info__full-wrap_active': !!showsidebar}">
                    <h2 class="ya-media-page__title ya-title ya-relative ya-center">
                        Поиск
                    </h2>
                    <div class="ya-form ya-form_wide">
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-name" class="ya-input__label">
									Спортсмен
								</label>
                                </div>
                                <div class="ya-input__input">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-name" placeholder="Имя Фамилия" class="ya-input__field" type="text" ng-model="search.fio" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-mail" class="ya-input__label">
									E-mail
								</label>
                                </div>
                                <div class="ya-input__input">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-mail" placeholder="E-mail" class="ya-input__field" type="text" ng-model="search.mail" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-city" class="ya-input__label">
									Город
								</label>
                                </div>
                                <div class="ya-input__input">
                                    <div class="ya-input__field-wrapper">
                                        <autocomplete-block substr="" area="city" country="search.location_country.cid" on-set="search.location_city = item"></autocomplete-block>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_no-pad ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-age" class="ya-input__label">
									Возраст
								</label>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-2">
                                    <input id="ya-age" placeholder="От" class="ya-input__field" type="number" ng-model="search.agefrom" />
                                </div>
                                <div class="ya-grid-1-2">
                                    <input id="ya-age-2" placeholder="До" class="ya-input__field" type="number" ng-model="search.ageto" />
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-sex" class="ya-input__label">
									Пол
								</label>
                                </div>
                                <div class="ya-input__input">
                                    <div class="ya-input__field-wrapper">
                                        <select id="ya-sex" placeholder="Пол" ng-model="search.sex" class="ya-input__field">
                                            <option value="">Неважно</option>
                                            <option value="1">Мужской</option>
                                            <option value="0">Женский</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_no-pad ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-height" class="ya-input__label">
									Рост
								</label>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-2">
                                    <input id="ya-height" placeholder="От" class="ya-input__field" type="number" ng-model="search.heightfrom" />
                                </div>
                                <div class="ya-grid-1-2">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-height-2" placeholder="До" class="ya-input__field" type="number" ng-model="search.heightto" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_no-pad ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-weight" class="ya-input__label">
									Вес
								</label>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-2">
                                    <input id="ya-weight" placeholder="От" class="ya-input__field" type="number" ng-model="search.weightfrom" />
                                </div>
                                <div class="ya-grid-1-2">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-weight-2" placeholder="До" class="ya-input__field" type="number" ng-model="search.weightto" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_no-pad ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-waist" class="ya-input__label">
									Размер талии
								</label>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-2">
                                    <input id="ya-waist" placeholder="От" class="ya-input__field" type="number" ng-model="search.waistfrom" />
                                </div>
                                <div class="ya-grid-1-2">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-waist-2" placeholder="До" class="ya-input__field" type="number" ng-model="search.waistto" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_no-pad ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-chest" class="ya-input__label">
									Размер груди
								</label>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-2">
                                    <input id="ya-chest" placeholder="От" class="ya-input__field" type="number" ng-model="search.chestfrom" />
                                </div>
                                <div class="ya-grid-1-2">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-chest-2" placeholder="До" class="ya-input__field" type="number" ng-model="search.chestto" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_no-pad ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-input__label ya-input__label_block">
                                    <label for="ya-huckle" class="ya-input__label">
									Бедра
								</label>
                                </div>
                            </div>
                        </div>
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-2">
                                    <input id="ya-huckle" placeholder="От" class="ya-input__field" type="number" ng-model="search.hucklefrom" />
                                </div>
                                <div class="ya-grid-1-2">
                                    <div class="ya-input__field-wrapper">
                                        <input id="ya-huckle-2" placeholder="До" class="ya-input__field" type="number" ng-model="search.huckleto" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--
<div class="ya-form__input ya-input ya-input_inline">
    <div class="ya-clearfix">
        <div class="ya-input__label ya-input__label_block">
            <label for="ya-adv" class="ya-input__label">
                По объявлению
            </label>
        </div>
        <div class="ya-input__input">
            <div class="ya-input__field-wrapper">
                <textarea id="ya-adv" placeholder="окно ввода ключевых слов объявления" class="ya-input__field ya-input__field_textarea" type="text" ng-model="search.fio"><textarea/>
            </div>
        </div>
    </div>
</div>
-->
                        <div class="ya-form__input ya-input ya-input_inline">
                            <div class="ya-clearfix">
                                <div class="ya-grid-1-1 ya-center">
                                    <button ng-click="find_users()" class="ya-btn ya-btn_secondary ya-btn_inline">Искать!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ya-grid-11-20">
                <div class="ya-search-result">
                    <div class="ya-search-result__head ya-media-page__title ya-media-page__title_small ya-clearfix">
                        <div class="ya-grid-2-5">
                            <div class="ya-form__input ya-input ya-input_small ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-sort" class="ya-input__label">
											Сорт. по
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <select ng-model="order" id="ya-sort" class="ya-input__field ya-input__field_select ya-input__select">
												<option value="rating">По рейтингу</option>
												<option value="age">По возрасту</option>
											</select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ya-grid-3-5">
                            <div class="ya-grid-1-2">
                                <div class="ya-form__input ya-input ya-input_small ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-3 ya-right">
                                            <label for="ya-sport" class="ya-input__label">
												Спорт
											</label>
                                        </div>
                                        <div class="ya-grid-2-3">
                                            <div class="ya-input__field-wrapper">
                                                <select ng-model="sport" id="ya-sport" class="ya-input__field ya-input__field_select ya-input__select">
													<option></option>
													<option ng-repeat="s in sports">{{s.sport}}</option>
												</select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-grid-1-2">
                                <div class="ya-form__input ya-input ya-input_small ya-input_inline">
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-3 ya-right">
                                            <label for="ya-status" class="ya-input__label">
												Статус
											</label>
                                        </div>
                                        <div class="ya-grid-2-3">
                                            <div class="ya-input__field-wrapper">
                                                <select id="ya-status" class="ya-input__field ya-input__field_select ya-input__select" ng-model="hobbie">
													<option></option>
													<option ng-repeat="h in hobbies">{{h.item}}</option>
												</select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-search-result__list ya-search-result__list_empty" ng-show="!users || !users.length">
                        По Вашим параметрам ничего не найдено.
                    </div>
                    <div class="ya-search-result__list ya-users">
                        <div class="ya-info-block ya-info-block_search ya-users__item" ng-if="!me(user._id)" ng-repeat="user in users | search_filter:order:sport:hobbie">
                            <div class="ya-info-block__title ya-info-block__title_name">
                                <a href="#/user/{{user._id}}">{{user.name}} {{user.surname}}, {{user.city}}</a>
                            </div>
                            <div class="ya-info-block__content ya-clearfix">
                                <div class="ya-grid-1-5">
                                    <div class="ya-avatar ya-avatar_search">
                                        <a href="#/user/{{user._id}}">
                                            <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                        </a>
                                    </div>
                                </div>
                                <div class="ya-grid-4-5">
                                    <div class="ya-clearfix">
                                        <div class="ya-user__raiting ya-raiting ya-raiting_small">
                                            <!--span>{{rating}}</span-->
                                            <span ng-click="mark(5);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 5, 'ya-raiting__star_empty': rating === 4, 'ya-raiting__star_half': (rating>4)&&(rating<5)}"></span>
                                            <span ng-click="mark(4);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 4, 'ya-raiting__star_empty': rating === 3, 'ya-raiting__star_half': (rating>3)&&(rating<4)}"></span>
                                            <span ng-click="mark(3);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 3, 'ya-raiting__star_empty': rating === 2, 'ya-raiting__star_half': (rating>2)&&(rating<3)}"></span>
                                            <span ng-click="mark(2);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 2, 'ya-raiting__star_empty': rating === 1, 'ya-raiting__star_half': (rating>1)&&(rating<2)}"></span>
                                            <span ng-click="mark(1);" class="ya-raiting__star" ng-class="{'ya-raiting__star_full': rating >= 1, 'ya-raiting__star_empty': !rating, 'ya-raiting__star_half': (rating>0)&&(rating<1)}"></span>
                                        </div>
                                    </div>
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-2-5">
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Возраст:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{get_age(user.birthDate) || "н/д"}}</div>
                                            </div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Рост:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.height || "н/д"}}</div>
                                            </div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Вес:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.weight || "н/д"}}</div>
                                            </div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Цвет волос:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.hairs || "н/д"}}</div>
                                            </div>
                                        </div>
                                        <div class="ya-grid-2-5 ya-relative">
                                            <div class="ya-fake-border"></div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Грудь:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.chest || "н/д"}}</div>
                                            </div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Талия:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.waist || "н/д"}}</div>
                                            </div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Бедра:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.huckle || "н/д"}}</div>
                                            </div>
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Сложение:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.type || "н/д"}}</div>
                                            </div>
                                        </div>
                                        <div class="ya-grid-1-5">
                                            <a ng-click="fav(user._id)" class="ya-add-to-friend">
                                                <span class="ya-add-to-friend__title" ng-show="!in_fav(user._id)">
													Добавить в избранные
												</span>
                                                <span class="ya-add-to-friend__icon" ng-show="!in_fav(user._id)"></span>
                                                <span class="ya-add-to-friend__title ya-add-to-friend__title_remove" ng-show="in_fav(user._id)">
													Добавлен в избранные
												</span>
                                                <span class="ya-add-to-friend__icon ya-add-to-friend__icon_remove" ng-show="in_fav(user._id)"></span>
                                            </a>
                                        </div>
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