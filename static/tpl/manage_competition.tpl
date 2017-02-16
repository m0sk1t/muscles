<article>
    <section>
        <h3>{{competition.title}}</h3>

        <p>
            дата начала <input type="date" placeholder="end" ng-model="competition.start" />
        </p>
        <p>
            дата окончания <input type="date" placeholder="start" ng-model="competition.end">
        </p>
        страна
        <autocomplete-block area="country" substr="competition.country.title" on-set="competition.country = item"></autocomplete-block>
        город
        <autocomplete-block area="city" substr="competition.city.title" country="competition.country.cid" on-set="competition.city = item"></autocomplete-block>
        <p>
            вид спорта
            <select ng-model="competition.sport">
				<option ng-repeat="s in sports">{{s.sport}}</option>
			</select>
        </p>
        <p>
            место <input type="text" placeholder="place" ng-model="competition.place">
        </p>
        <p>
            заголовок <input type="text" placeholder="title" ng-model="competition.title">
        </p>
        <p>
            номинация <input type="text" placeholder="nomination" ng-model="competition.nomination">
        </p>
        <p>
            описание <input type="text" placeholder="description" ng-model="competition.description">
        </p>
        <button ng-click="update_competition()">Save</button>
    </section>
</article>