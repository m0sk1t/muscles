<div class="ya-multiselect ya-relative">
    <input ng-model="substr" ng-change="load()" type="text" class="ya-input__field ya-input__field_multiselect ya-multiselect__input">
    <div class="ya-multiselect__wrapper">
        <div class="ya-multiselect__scroller">
            <div class="ya-multiselect__item" ng-repeat="i in items | filter: substr" ng-click="set(i);">
                {{i.title}}
                <div class="ya-multiselect__subitem">{{i.area || ''}}</div>
            </div>
        </div>
    </div>
</div>