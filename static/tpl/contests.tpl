<article>
	<section>
		<div ng-repeat="c in contests">
			<a ng-href="#/contest/{{c._id}}">more...</a>
			<h3>{{c.title}}</h3>
			<div>{{c.type}}</div>
			<div>{{c.title}}</div>
			<div>{{c.prize}}</div>
			<div>{{c.dateEnd}}</div>
			<div>{{c.dateStart}}</div>
			<div>{{c.freeVoices}}</div>
			<div>{{c.paidVoices}}</div>
			<div>{{c.description}}</div>
		</div>
	</section>
</article>
