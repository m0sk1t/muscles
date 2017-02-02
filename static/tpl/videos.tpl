<article class="ya-videos-page ya-media-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-media-page__gallery">
                    <h2 class="ya-media-page__title ya-relative">
                        {{options.user._id === user._id?'Мои видео':'Видео пользователя'}}
                        <span class="ya-albums__create-btn" ng-if="options.user._id === user._id" ng-click="layer.addVideo = {link:'',title:''}"></span>
                    </h2>

                    <div class="ya-photos ya-photos_profile">
                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!videos || !videos.length">
                            Пока не добавлено ни одного видео
                        </div>
                        <div class="ya-photos__list ya-clearfix" ng-show="videos && videos.length">
                            <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="v in videos track by $index">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img ya-photos__img_large" ng-click="gallery.current_video = $index" ng-style="{'background-image':'url(' + v.thumbnail + ')'}"></div>
                                    <div class="ya-photos__actions">
                                        <span class="ya-photos__action-btn fa fa-edit" ng-click="layer.editedVideo = v;" ng-if="options.user._id === v.owner"></span>
                                        <span class="ya-photos__action-btn fa fa-close" ng-click="delete_video($index)" ng-if="options.user._id === v.owner"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.addVideo == null" ng-click="layer.addVideo = null;">
                    <div class="ya-pop-up__wrapper">
                        <span class="ya-pop-up__close-btn" ng-click="layer.editedAlbum = null;">X</span>
                        <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-video-name" class="ya-input__label">
											Название видео
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input id="ya-video-name" type="text" class="ya-input__field" placeholder="Название видео" ng-model="layer.addVideo.title">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-video-link" class="ya-input__label">
											Ссылка на видео
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input id="ya-video-link" type="text" class="ya-input__field" placeholder="Ссылка на видео" ng-model="layer.addVideo.link">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="layer.addVideo = null;" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
                                    </div>
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="add_video(layer.addVideo)" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.editedVideo == null" ng-click="layer.layer.editedVideo = null;">
                    <div class="ya-pop-up__wrapper">
                        <span class="ya-pop-up__close-btn" ng-click="layer.layer.editedVideo = null;">X</span>
                        <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-video-name" class="ya-input__label">
											Название видео
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input id="ya-video-name" type="text" class="ya-input__field" placeholder="Название видео" ng-model="layer.editedVideo.title">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="edit_video(layer.editedVideo)" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
                                    </div>
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="layer.editedVideo = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <video-slider-block ng-hide="gallery.current_video === null" ng-keypress="manage_video_keypress($event);">
                </video-slider-block>
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
