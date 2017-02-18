<div class="ya-profile-links_head">
    <a href="#" ng-class="{'ya-btn_secindary': showProfileLinks}" class="ya-sidebar-info__mobile-link ya-center ya-btn ya-btn_primary" ng-click="$event.preventDefault(); showTopMenu=!showTopMenu">Меню</a>
    <div class="ya-profile-links ya-clearfix" ng-class="{'ya-profile-links_active': showTopMenu}">
        <div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
            <a href="#/dialogs" class="ya-profile-links__link ya-profile-links__link_chat"><span class="ya-profile-links__link-img ya-profile-links__link-img_chat"></span></a>
        </div>
        <div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
            <a href="#/user/{{user._id || options.user._id}}/photos/all" class="ya-profile-links__link ya-profile-links__link_photos"><span class="ya-profile-links__link-img ya-profile-links__link-img_photos"></span></a>
        </div>
        <div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
            <a href="#/user/{{user._id || options.user._id}}/videos/all" class="ya-profile-links__link ya-profile-links__link_videos"><span class="ya-profile-links__link-img ya-profile-links__link-img_videos"></span></a>
        </div>
        <div class="ya-profile-links__link-wrapper ya-inner-grid-1-2">
            <a href="#/favs" class="ya-profile-links__link ya-profile-links__link_favs"><span class="ya-profile-links__link-img ya-profile-links__link-img_favs"></span></a>
        </div>
    </div>
</div>