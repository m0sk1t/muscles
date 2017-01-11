<article>
	<section>
		<div>
			<a href="" ng-click="change_view('month', 'competitions')">Календарь На Месяц</a>
			<a href="" ng-click="change_view('agendaWeek', 'competitions')">Календарь На Неделю</a>
			<a href="" ng-click="change_view('agendaDay', 'competitions')">Календарь На День</a>
			<select name="" id="">
				<option value="">По категориям</option>
			</select>
			<input type="text">
		</div>
		<div ui-calendar="calendarOptions" ng-model="eventSources" calendar="competitions"></div>
		<div>
			<div ng-repeat="c in competitions">
				<h3>{{c.title}}</h3>
				<div>{{c.date}}</div>
				<div>{{c.city}}</div>
				<div>{{c.place}}</div>
				<div>{{c.title}}</div>
				<div>{{c.nomination}}</div>
				<div>{{c.description}}</div>
				<a href="#/competition/{{c._id}}">Подробнее</a>
			</div>
		</div>
	</section>
</article>
