<article class="ya-manage-article ya-container ya-relative">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-1">
                <section class="ya-form ya-form_manager">
                    <h2 class="ya-media-page__title ya-relative">
                        Конкурс {{contest.title}}
                    </h2>
                    <div class="ya-form__input ya-input ya-input_inline ya-manager__actons">
                        <button class="ya-btn ya-btn_small" ng-click="update_contest();">Сохранить</button>
                        <a href="#" class="ya-btn ya-btn_small ya-btn_secondary" onClick="javascript:history.go(-1);">Отменить</a>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-title" class="ya-input__label">
                                    Заголовок
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-title" class="ya-input__field" type="text" ng-model="contest.title" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-sex" class="ya-input__label">
                                    Для кого
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <select ng-model="contest.type" id="ya-sex" class="ya-input__field ya-input__field_select">
                                        <option>Мужчинам</option>
                                        <option>Женщинам</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-desc" class="ya-input__label">
                                    Описание
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <textarea id="ya-title" class="ya-input__field ya-input__field_textarea" ng-model="contest.description"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-price" class="ya-input__label">
                                    Призовой фонд
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-price" class="ya-input__field" type="number" ng-model="contest.prize" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-date-start" class="ya-input__label">
                                    Дата начала
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-date-start" class="ya-input__field" type="date" ng-model="contest.dateStart" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-date-end" class="ya-input__label">
                                    Дата окончания
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-date-end" class="ya-input__field" type="date" ng-model="contest.dateEnd" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-date-participate" class="ya-input__label">
                                    Дата окончания приёма заявок
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-date-participate" class="ya-input__field" type="date" ng-model="contest.dateParticipate" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-photos__list ya-photos__list_manager ya-clearfix" ng-show="contest.participants && contest.participants.length">
                        <h3>Участники</h3>
                        <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="user in contest.participants track by $index">
                            <div class="ya-photos__wrapper">
                                <div class="ya-photos__img ya-photos__img_large" ng-style="{'background-image':'url(' + (user.avatar || '/images/avatar.jpg') + ')'}" title="{{user.name + ' ' + user.surname}}"></div>
                                <div class="ya-photos__actions">
                                    <a href="#/manage/user/{{user._id}}" target="_blank" class="ya-photos__action-btn"><span class="fa fa-user" title="Посмотреть профиль пользователя" ></span></a>
                                    <span class="ya-photos__action-btn fa fa-close" title="Удалить" ng-click="del($index);"></span>
                                </div>
                            </div>
                            <div class="ya-photos__user-name">{{user.name + ' ' + user.surname}}</div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</article>