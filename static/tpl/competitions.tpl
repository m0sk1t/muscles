<article>
	<section>
		<div>
			<a href="#">За год</a>
			<a href="#">По месяцам</a>
			По категориям
			<select name="" id="">
				<option value=""></option>
			</select>
			<input type="text">
		</div>
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
	</section>
</article>
