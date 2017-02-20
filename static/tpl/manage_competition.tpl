<article class="ya-manage-article ya-container ya-relative">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-1">
                <section class="ya-form ya-form_manager">
                    <h2 class="ya-media-page__title ya-relative">
                        Соревнование {{competition.title}}
                    </h2>
                    <div class="ya-form__input ya-input ya-input_inline ya-manager__actons">
                        <button class="ya-btn ya-btn_small" ng-click="update_competition();">Сохранить</button>
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
                                    <input id="ya-title" class="ya-input__field" type="text" ng-model="competition.title" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-sport" class="ya-input__label">
                                    Вид спорта
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <select ng-model="competition.sport" id="ya-sport" class="ya-input__field ya-input__field_select">
                                        <option ng-repeat="s in sports">{{s.sport}}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-nomination" class="ya-input__label">
                                    Номинация
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-nomination" class="ya-input__field" type="text" ng-model="competition.nomination" />
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
                                    <textarea id="ya-title" class="ya-input__field ya-input__field_textarea" ng-model="competition.description"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label class="ya-input__label">
                                    Страна
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <autocomplete-block area="country" substr="competition.country.title" on-set="competition.country = item"></autocomplete-block>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label class="ya-input__label">
                                    Город
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <autocomplete-block area="city" substr="competition.city.title" country="competition.country.cid" on-set="competition.city = item"></autocomplete-block>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div>
                                <label for="ya-place" class="ya-input__label">
                                    Место
                                </label>
                            </div>
                            <div>
                                <div class="ya-input__field-wrapper">
                                    <input id="ya-place" class="ya-input__field" type="text" ng-model="competition.place" />
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
                                    <input id="ya-date-start" class="ya-input__field" type="date" ng-model="competition.start" />
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
                                    <input id="ya-date-end" class="ya-input__field" type="date" ng-model="competition.end" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</article>