<article class="ya-photos-page ya-media-page ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-4-5">
                <div class="ya-albums">
                    <h2 class="ya-media-page__title ya-title ya-relative">
                        {{options.user._id === options.userid?'Мои фотоальбомы':'Фотоальбомы пользователя'}}
                        <span class="ya-albums__create-btn" ng-click="create_album()" ng-if="options.user._id === user._id">
						</span>
                    </h2>
                    <div class="ya-photos ya-photos_profile">
                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!albums || !albums.length">
                            Пока не добавлено ни одной фотографии
                        </div>
                        <div class="ya-photos__list ya-clearfix" ng-show="albums && albums.length">
                            <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="a in albums">
                                <div class="ya-photos__wrapper">
                                    <a href="#/user/{{options.userid}}/album/{{a._id}}" class="ya-photos__img ya-photos__img_large" ng-style="{'background-image':'url(' + (a.cover.image || '/images/avatar.jpg') + ')'}"></a>
                                    <a href="#/user/{{options.userid}}/album/{{a._id}}" class="ya-photos__img-title">{{::a.title}}</a>
                                    <div class="ya-photos__actions">
                                        <span class="ya-photos__action-btn fa fa-edit" ng-click="layer.editedAlbum = a" ng-if="options.user._id === a.owner"></span>
                                        <span class="ya-photos__action-btn fa fa-close" ng-click="delete_album(a._id)" ng-if="options.user._id === a.owner"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-media-page__gallery">
                    <h2 class="ya-media-page__title ya-relative">
                        {{options.user._id === user._id?'Мои фотографии':'Фотографии пользователя'}}
                        <span class="ya-albums__create-btn" ngf-multiple="true" ngf-pattern="'image/*'" ngf-drop="upload_files($files)" ngf-drag-over-class="'dragover'" ngf-select="upload_files($files)" ng-if="options.user._id === user._id">						</span>
                    </h2>
                    <div class="ya-photos ya-photos_profile">
                        <div class="ya-photos__list ya-photos__list_empty" ng-show="!photos || !photos.length">
                            Пока не добавлено ни одной фотографии
                        </div>
                        <div class="ya-photos__list ya-clearfix" ng-show="photos && photos.length">
                            <div class="ya-photos__item ya-photos__item_large ya-inner-grid-1-4" ng-repeat="p in photos track by $index">
                                <div class="ya-photos__wrapper">
                                    <div class="ya-photos__img ya-photos__img_large" ng-click="gallery.current_photo = $index" ng-style="{'background-image':'url(' + p.image + ')'}"></div>
                                    <div class="ya-photos__actions">
                                        <span class="ya-photos__action-btn fa fa-edit" ng-click="layer.editedPhoto = p;" ng-if="options.user._id === p.owner"></span>
                                        <span class="ya-photos__action-btn fa fa-close" ng-click="delete_photo($index)" ng-if="options.user._id === p.owner"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.editedPhoto == null" ng-click="layer.editedPhoto = null;">
                    <div class="ya-pop-up__wrapper">
                        <span class="ya-pop-up__close-btn" ng-click="layer.editedPhoto = null;">X</span>
                        <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-photo-name" class="ya-input__label">
											Название фото
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input Id="ya-photo-name" type="text" placeholder="Название фото" class="ya-input__field" ng-model="layer.editedPhoto.title">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-album" class="ya-input__label">
											Альбом
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <select ng-model="layer.editedPhoto.album" id="ya-album" class="ya-input__field ya-input__field_select ya-input__select">
												<option ng-value="al._id" ng-repeat="al in albums">{{al.title}}</option>
											</select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="edit_photo(layer.editedPhoto)" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
                                    </div>
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="layer.editedPhoto = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ya-pop-up ya-pop-up_small ya-pop-up_active" ng-hide="layer.editedAlbum == null" ng-click="layer.editedAlbum = null;">
                    <div class="ya-pop-up__wrapper">
                        <span class="ya-pop-up__close-btn" ng-click="layer.editedAlbum = null;">X</span>
                        <div class="ya-pop-up__content" ng-click="$event.stopPropagation();">

                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-3 ya-right">
                                        <label for="ya-photo-name" class="ya-input__label">
											Название альбома
										</label>
                                    </div>
                                    <div class="ya-grid-2-3">
                                        <div class="ya-input__field-wrapper">
                                            <input type="text" class="ya-input__field" placeholder="Название альбома" ng-model="layer.editedAlbum.title">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ya-form__input ya-input ya-input_inline">
                                <div class="ya-clearfix">
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="edit_album(layer.editedAlbum)" class="ya-btn ya-btn_secondary ya-btn_inline">Сохранить</button>
                                    </div>
                                    <div class="ya-grid-1-2 ya-center">
                                        <button ng-click="layer.editedAlbum = null;" class="ya-btn ya-btn_primary ya-btn_inline">Отменить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <photo-slider-block ng-hide="gallery.current_photo === null" ng-keydown="manage_photo_keypress($event)">
                </photo-slider-block>
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
