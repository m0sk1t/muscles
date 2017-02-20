<article class="ya-manage-article ya-container ya-relative">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-1">
                <section class="ya-form ya-form_manager">
                    <div class="ya-form__input ya-input ya-input_inline ya-manager__actons">
                        <button class="ya-btn ya-btn_small" ng-click="update_article();">Сохранить</button>
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
                                    <input id="ya-title" class="ya-input__field" type="text" ng-model="article.title" />
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
                                    <textarea id="ya-title" class="ya-input__field ya-input__field_textarea" ng-model="article.description"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-form__input ya-input ya-input_inline">
                        <div class="ya-clearfix">
                            <div class="ya-grid-1-2">
                                <div>
                                    <label for="ya-sports" class="ya-input__label">
                                        Вид спорта
                                    </label>
                                </div>
                                <div>
                                    <div class="ya-input__field-wrapper">
                                        <select ng-model="article.sport" id="ya-sports" class="ya-input__field ya-input__field_select">
                                            <option ng-repeat="s in sports">{{s.sport}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-grid-1-2">
                                <div>
                                    <label for="ya-theme" class="ya-input__label">
                                        Тема
                                    </label>
                                </div>
                                <div>
                                    <div class="ya-input__field-wrapper">
                                        <select ng-model="article.theme" id="ya-theme" class="ya-input__field ya-input__field_select">
                                            <option ng-repeat="t in themes">{{t.title}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ya-clearfix">
                        <div class="ya-grid-1-1">
                            <textarea froala="froalaOptions" ng-model="article.text"></textarea>
                        </div>
                    </div>
                    {{con}}
            	</section>
            </div>
        </div>
    </div>
</article>