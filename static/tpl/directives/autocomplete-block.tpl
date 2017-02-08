<div>
    <input ng-model="substr" ng-change="load()" type="text" class="ya-input__field">
    <div>
        <div ng-repeat="i in items | filter: substr" ng-click="set(i);">
            {{i.title}}
            <p style="font-size: .7rem;">{{i.area || ''}}</p>
        </div>
    </div>
</div>