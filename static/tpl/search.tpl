<article class="search-page">
	<div class="sort">Сортировать</div>
	<section>
		<span class="search-results">
			<a href="#/user/{{options.user._id}}">
				<div class="search-result" ng-repeat="u in users track by $index">
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
			<h3>Поиск<button ng-click="find_users()">search</button></h3>
			<input type="text" placeholder="Имя Фамилия" ng-model="search.fio">
			<h5>Город</h5>
			<select name="" id="">
				<option value="">Выбор города</option>
			</select>
			<h5>Пол</h5>
			<div>
				<label for="">
					<input type="radio">
					Мужской
				</label><br>
				<label for="">
					<input type="radio">
					Женский
				</label><br>
				<label for="">
					<input type="radio">
					Любой
				</label><br>
			</div>
			<h5>Возраст</h5>
			<select name="" id="">
				<option value="">от</option>
			</select>
			<select name="" id="">
				<option value="">до</option>
			</select>
			<h5>Рост</h5>
			<select name="" id="">
				<option value="">от</option>
			</select>
			<select name="" id="">
				<option value="">до</option>
			</select>
			<h5>Вес</h5>
			<select name="" id="">
				<option value="">от</option>
			</select>
			<select name="" id="">
				<option value="">до</option>
			</select>
			<h5>По объявлению</h5>
			<input type="text" placeholder="Ключевые слова">
		</span>
	</section>
</article>
