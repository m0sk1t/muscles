\<article class="ya-dialoges ya-container ya-relative" ng-class="{'ya-container_pad':!!showTopMenu, 'ya-container_pad_menu':!showTopMenu}">
    <div class="ya-narrower">
        <div class="ya-row">
            <div class="ya-grid-1-3">
            <a href="#" ng-click="$event.preventDefault();showsidebar = !showsidebar;" class="ya-sidebar-info__mobile-link ya-center ya-btn ya-btn_primary" ng-class="{'ya-sidebar-info__mobile-link_active': showsidebar}">
              Параметры поиска
            </a>
            <div class="ya-sidebar-info__full-wrap" ng-class="{'ya-sidebar-info__full-wrap_active': !!showsidebar}">
                <div class="ya-dialoges__penpals ya-penpals">
                    <h2 class="ya-media-page__title ya-media-page__title_dialogs ya-title ya-relative ya-center">
                        Список диалогов
                    </h2>
                    <div class="ya-penpals__list">
                        <div class="ya-penpals__item ya-clearfix" ng-repeat="d in dialogs track by $index" ng-click="set_messages(d, $index);">
                            <div class="ya-grid-1-5">
                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                    <img ng-src="{{user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                </div>
                            </div>
                            <div class="ya-grid-4-5">
                                <div class="ya-penpals__title ya-clearfix">
                                    <div class="ya-penpals__name ya-grid-2-3 ya-left">
                                        {{with_user(d)}}
                                    </div>
                                    <div class="ya-penpals__date ya-grid-1-3 ya-right">
                                        {{format_date(d.messages[d.messages.length - 1].t)}}
                                    </div>
                                </div>
                                <div class="ya-penpals__msg">
                                    {{d.messages[d.messages.length - 1].text}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="ya-grid-7-15">
                <h2 class="ya-media-page__title ya-media-page__title_msgs ya-title ya-relative">
                    {{with_user(dialogs[dialogIndex])}}
                </h2>
                <div class="ya-dialog ya-relative">
                    <div class="ya-dialog__content">
                        <div class="ya-wall">
                            <div class="ya-wall__news">
                                <div class="ya-wall__news-list">
                                    <!--div class="ya-wall__news-item">
										<div class="ya-wall__news-content">
											<div class="ya-wall__news-text ya-wall__news-text_empty ya-center">
												Пока не добавлено ни одного сообщения.
											</div>
										</div>
									</div-->
                                    <div class="ya-wall__news-item" ng-repeat="m in messages">
                                        <div class="ya-wall__news-content">
                                            <div class="ya-wall__news-author ya-relative ya-clearfix">
                                                <!--div class="ya-wall__news-remove" ng-if="options.user._id === user._id" ng-click="del_topic($index)">x</div-->
                                                <div class="ya-avatar ya-avatar_small ya-wall__avatar">
                                                    <img ng-src="{{m.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                </div>
                                                <div class="ya-wall__news-info ya-clearfix">
                                                    <div class="ya-wall__author-name">
                                                        {{detect_user(dialogs[dialogIndex], m.uid)}}
                                                    </div>
                                                    <div class="ya-wall__news-date">
                                                        {{format_date(m.t)}}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ya-wall__news-text">
                                                <pre>{{m.text}}</pre>
                                            </div>
                                            <div class="ya-wall__news-media">
                                                <img ng-src="{{i}}" ng-repeat="i in m.images" class="ya-wall__news-img" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ya-new-post__form">
                                      <form ng-submit="add_message()" class="ya-form" ng-show="messages.length">
                                          <div class="ya-form__input ya-input ya-input_inline ya-input_small-pad ya-input_message">
                                              <div class="ya-clearfix">
                                                  <div class="ya-grid-1-6">
                                                      <div class="ya-avatar ya-avatar_small ya-avatar_message">
                                                          <img ng-src="{{options.user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" />
                                                      </div>
                                                  </div>
                                                  <div class="ya-grid-5-6">
                                                      <div class="ya-input__field-wrapper ya-input__field-wrapper_textarea ya-relative">
                                                          <textarea rows="10" class="ya-input__field ya-input__field_textarea ya-input__field_unbordered ya-input__field_message" ng-model="message" placeholder="Введите сообщение"></textarea>
                                                          <div class="ya-new-post__btns-wrapper">
                                                              <div class="ya-avatar ya-avatar_small ya-avatar_message">
                                                                  <img ng-src="{{options.user.avatar || '/images/avatar.jpg'}}" class="ya-avatar__img" ng-click="add_message()" />
                                                              </div>
                                                              <!--div class="ya-new-post__btn ya-pop-btn ya-pop-btn_adds">
                                                                  <div class="ya-pop-btn__pop-up">
                                                                      <ul class="ya-pop-btn__list">
                                                                          <li class="ya-pop-btn__item">
                                                                              <span class="ya-pop-btn__link ya-pop-btn__link_photo" ng-click="gallery.add_image = !gallery.add_image;">Фото</span>
                                                                          </li>
                                                                          <li class="ya-pop-btn__item">
                                                                              <span class="ya-pop-btn__link ya-pop-btn__link_video" ng-click="gallery.add_video = !gallery.add_video;">Видео</span>
                                                                          </li>
                                                                      </ul>
                                                                    </div>
                                                                </div-->
                                                               <!--div class="ya-wall__news-media">
                                                                   <img ng-src="{{i}}" ng-repeat="i in t.images" class="ya-wall__news-img" />
                                                               <div class="ya-new-post__btn ya-pop-btn ya-pop-btn_smiles">
                                                                  <div class="ya-smiles ya-pop-btn__pop-up">
                                                                      Smiles ))
                                                                  </div>
                                                                </div-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                       </form>
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
