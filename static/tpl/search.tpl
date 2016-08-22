<article class="search-page">
	<div class="sort">Сортировать</div>
	<section>
		<span class="search-results">
			<a ng-repeat="u in users track by $index" href="#/user/{{u._id}}">
				<div class="search-result">
					<span class="avatar">
						<img ng-src="{{u.avatar}}" alt="ava">
					</span>
					<span>
						<div class="mark">
							* * * * *
						</div>
						<div>
							{{u.status}}
						</div>
					</span>
					<span>
						<div class="bio">
							<span>{{u.name}} {{u.surname}}, {{u.city}}</span>
							<span class="fav">V</span>
						</div>
						<div class="params">
							<span>
								<div class="param">
									Возраст: {{u.age}}
								</div>
								<div class="param">
									Рост: {{u.height}}
								</div>
								<div class="param">
									Вес: {{u.weight}}
								</div>
							</span>
							<span>
								<div class="param">
									Цвет волос: {{u.hairs}}
								</div>
								<div class="param">
									Типаж: {{u.type}}
								</div>
								<div class="param">
									Размер груди: {{u.chest}}
								</div>
								<div class="param">
									Размер талии: {{u.waist}}
								</div>
								<div class="param">
									Размер бёдер: {{u.huckle}}
								</div>
							</span>
						</div>
					</span>
				</div>
			</a>
		</span>
		<span class="search-options">
			<h3>Поиск <button ng-click="find_users()">искать!</button></h3>
			<input type="text" placeholder="Имя Фамилия" ng-model="search.fio">
			<input type="text" placeholder="почта" ng-model="search.mail">
			<h5>Город</h5>
			<select name="" id="">
				<option value="">Выбор города</option>
			</select>
			<h5>Пол</h5>
			<div>
				<select name="" id="" ng-model="search.sex">
					<option value="n">Неважно</option>
					<option value="m">Мужской</option>
					<option value="w">Женский</option>
				</select>
			</div>
			<h5>Возраст</h5>
			<select name="" id="" ng-model="search.agefrom">
				<option value="">от</option>
				<option value="25">25</option>
			</select>
			<select name="" id="" ng-model="search.ageto">
				<option value="">до</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
			</select>
			<h5>Рост</h5>
			<label>от: <input type="number" ng-model="search.heightfrom"></label>
			<label>до: <input type="number" ng-model="search.heightto"></label>
			<h5>Вес</h5>
			<label>от: <input type="number" ng-model="search.weightfrom"></label>
			<label>до: <input type="number" ng-model="search.weightto"></label>
			<h5>Грудь</h5>
			<label>от: <input type="number" ng-model="search.chestfrom"></label>
			<label>до: <input type="number" ng-model="search.chestto"></label>
			<h5>Талия</h5>
			<label>от: <input type="number" ng-model="search.waistfrom"></label>
			<label>до: <input type="number" ng-model="search.waistto"></label>
			<h5>Бёдра</h5>
			<label>от: <input type="number" ng-model="search.hucklefrom"></label>
			<label>до: <input type="number" ng-model="search.huckleto"></label>
			<h5>По объявлению</h5>
			<input type="text" placeholder="Ключевые слова">
		</span>
	</section>
</article>
