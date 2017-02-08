<article class="ya-search-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-4">
                <a href="#" ng-click="$event.preventDefault();showsidebar = !showsidebar;" class="ya-sidebar-info__mobile-link ya-center ya-btn ya-btn_primary" ng-class="{'ya-sidebar-info__mobile-link_active': showsidebar}">
              Параметры поиска
            </a>
                <div class="ya-sidebar-info__full-wrap" ng-class="{'ya-sidebar-info__full-wrap_active': !!showsidebar}">
                    <!--h2 class="ya-media-page__title ya-title ya-relative ya-center">
                    Поиск
                </h2-->
                    <!--div class="ya-form ya-form_wide">
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
                                    <select id="ya-city" placeholder="Выбор города" class="ya-input__field ya-input__field_select ya-input__select">
										<option value="">Выбор города</option>
										<option value="Спорт 1">Город 1</option>
										<option value="Спорт 2">Город 2</option>
									</select>
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
                                <select id="ya-age" ng-model="search.agefrom" class="ya-input__field ya-input__field_select ya-input__select">
									<option value="">от</option>
									<option value="25">25</option>
								</select>
                            </div>
                            <div class="ya-grid-1-2">
                                <div class="ya-input__field-wrapper">
                                    <select id="ya-age-2" ng-model="search.ageto" class="ya-input__field ya-input__field_select ya-input__select">
										<option value="">до</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
									</select>
                                </div>
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
										<option value="n">Неважно</option>
										<option value="m">Мужской</option>
										<option value="w">Женский</option>
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
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div class="ya-grid-1-1 ya-center">
                                <button ng-click="find_users()" class="ya-btn ya-btn_secondary ya-btn_inline">Искать!</button>
                            </div>
                        </div>
                    </div>
                </div-->
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
                                            <select id="ya-sort" class="ya-input__field ya-input__field_select ya-input__select">
												<option>По рейтингу</option>
												<option>По возрасту</option>
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
                                                <select id="ya-sport" class="ya-input__field ya-input__field_select ya-input__select">
													<option></option>
													<option>Спорт 1</option>
													<option>Спорт 2</option>
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
                                                <select id="ya-status" class="ya-input__field ya-input__field_select ya-input__select">
													<option></option>
													<option>Статус 1</option>
													<option>Статус 2</option>
												</select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-search-result__list ya-search-result__list_empty" ng-show="!favs || !favs.length">
                        По Вашим параметрам ничего не найдено.
                    </div>
                    <div class="ya-search-result__list ya-users">
                        <div class="ya-info-block ya-info-block_search ya-users__item" ng-repeat="user in favs track by $index">
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
                                    <!--div class="ya-clearfix ya-date-info">
                                        Просмотр анкеты: 17.06.1991 в 15:23
                                    </div-->
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-2">
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Возраст:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.age || "н/д"}}</div>
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
                                        <div class="ya-grid-1-2 ya-relative">
                                            <div class="ya-fake-border"></div>
                                            <div class="ya-fav-actions">
                                                <a class="ya-fav-action__link ya-fav-action__link_write" ng-click="write_message(user);">Написать сообщение</a>
                                                <!--a href="#" class="ya-fav-action__link ya-fav-action__link_comment">Оставить комментарий</a-->
                                                <a class="ya-fav-action__link ya-fav-action__link_delete" ng-click="remove_from_fav(user._id)">Убрать</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--div class="ya-info-block ya-info-block_search ya-users__item">
                            <div class="ya-info-block__title ya-info-block__title_name">
                                <a href="#/user/{{user._id}}">{{user.name}} {{user.surname}}, {{user.city}} Иванов Иван, Иваново</a>
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
                                    <div class="ya-clearfix ya-date-info">
                                        Просмотр анкеты: 17.06.1991 в 15:23
                                    </div>
                                    <div class="ya-clearfix">
                                        <div class="ya-grid-1-2">
                                            <div class="ya-info-block__record ya-clearfix">
                                                <div class="ya-info-block__label ya-span-1-2">Возраст:</div>
                                                <div class="ya-info-block__value ya-span-1-2">{{user.age || "н/д"}}</div>
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
                                        <div class="ya-grid-1-2 ya-relative">
                                            <div class="ya-fake-border"></div>
                                            <div class="ya-fav-action">
                                                <a href="#" class="ya-fav-action__link ya-favs-action__link_write">Написать сообщение</a>
                                                <a href="#" class="ya-fav-action__link ya-favs-action__link_comment">Оставить комментарий</a>
						                        <a href="#" class="ya-fav-action__link ya-favs-action__link_delete">Убрать</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div-->
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