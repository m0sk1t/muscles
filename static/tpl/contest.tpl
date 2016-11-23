<article>
	<section>
		<h3>{{contest.title}}</h3>
		<div>{{contest.type}}</div>
		<div>{{contest.title}}</div>
		<div>{{contest.prize}}</div>
		<div>{{contest.dateEnd}}</div>
		<div>{{contest.dateStart}}</div>
		<div>{{contest.freeVoices}}</div>
		<div>{{contest.paidVoices}}</div>
		<div>{{contest.description}}</div>
		<div>
			<span ng-repeat="p in participants">
				<img ng-src="{{p.avatar}}" style="width: 200px">
				{{p.name}}
			</span>
		</div>
		<button ng-click="participate()">{{contest.participants.indexOf(options.user._id) === -1? 'Принять участие': 'Отказаться от участия'}}</button>
	</section>
</article>
