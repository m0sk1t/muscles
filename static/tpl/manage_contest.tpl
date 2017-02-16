<article>
    <section>
        <h3>{{contest.title}}</h3>

        <select ng-model="contest.type">
			<option>Man</option>
			<option>Woman</option>
		</select>
        <p>
            <input type="text" placeholder="title" ng-model="contest.title"><br />
        </p>
        <p>
            <input type="number" placeholder="prize" ng-model="contest.prize">руб.
        </p>
        <p>
            дата начала<input type="date" placeholder="dateStart" ng-model="contest.dateStart">
        </p>
        <p>
            дата окончания<input type="date" placeholder="dateEnd" ng-model="contest.dateEnd">
        </p>
        <p>
            <input type="text" placeholder="description" ng-model="contest.description">
        </p>
        <p>
            дата окончания приёма заявок<input type="date" placeholder="dateParticipate" ng-model="contest.dateParticipate">
        </p>
        <div>
            <div ng-repeat="p in contest.participants track by $index" style="width: 25%">
                <img ng-src="{{p.avatar}}">
                <a href="#/manage/user/{{p.id}}">Посмотреть профиль пользователя</a> {{p.name}}
                <div ng-click="del($index);">DEL</div>
            </div>
        </div>
        <button ng-click="update_contest()">Save</button>
    </section>
</article>