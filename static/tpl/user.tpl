<article class="ya-user ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-1-3">
				<div class="ya-page__block ya-user__main-info">

						<div class="ya-user__avatar ya-avatar ya-avatar_large">
							<a class="ya-avatar__link" href="#/options">
								<img class="ya-avatar__img" ng-src="{{user.avatar}}" alt="{{user.name}} {{user.surname}}">
							</a>
						</div>
					<div class="ya-user__name">
						<a href="#/options" ng-if="options.user._id === user._id">
							<i class="fa fa-lg fa-cog"></i>
						</a>
						{{user.name}} {{user.surname}}
					</div>
					<div class="city">{{user.city}}</div>
					<span class="mark">&#9733; &#9733; &#9733; &#9733; &#9733;</span>
					<span ng-class="{fav: in_fav()}">&#9825;</span>
					<button  ng-if="options.user._id !== user._id" ng-click="write_message();">Написать сообщение</button>
				</div>
				<div class="ya-page__block ya-user__sports">
					<div class="task">
						<label>
							<input type="checkbox" ng-if="classic_bb" ng-checked="classic_bb">
							Классический бодибилдинг
						</label>
						<label>
							<input type="checkbox" ng-if="crossfit" ng-checked="crossfit">
							Кроссфит
						</label>
						<label>
							<input type="checkbox" ng-if="fitness" ng-checked="fitness">
							Фитнесс
						</label>
					</div>
				</div>
				<div class="ya-page__block ya-user__awards">
					<h3>Достижения</h3>
					<section>
						<ul>
							<li>1 Место Мистер Иваново 2016</li>
							<li>2 Место Мистер Иваново 2015</li>
							<li>3 Место Мистер Иваново 2014</li>
						</ul>
					</section>
				</div>


			</div>
			<div class="ya-grid-7-15">
				<div class="ya-page__block ya-user__text-info">
					<span class="status-area">
					<div class="status-text">{{user.status}}</div>
					<div class="status">
						<label>
							<input type="checkbox" ng-if="classic_bb" ng-checked="classic_bb">
							Классический бодибилдинг
							<select name="" id="">
								<option value=""></option>
							</select>
						</label>
						<label>
							<input type="checkbox" ng-if="crossfit" ng-checked="crossfit">
							Кроссфит
							<select name="" id="">
								<option value=""></option>
							</select>
						</label>
						<label>
							<input type="checkbox" ng-if="fitness" ng-checked="fitness">
							Фитнесс
							<select name="" id="">
								<option value=""></option>
							</select>
						</label>
					</div>
					<div class="vacancies">
						<select name="" id="">
							<option value=""></option>
						</select>
						<select name="" id="">
							<option value=""></option>
						</select>
					</div>
					<div class="params">
						<span>
							<div>
								Возраст: {{get_age(user.birthDate)}}
							</div>
							<div>
								Рост: {{user.height}}
							</div>
							<div>
								Вес: {{user.weight}}
							</div>
						</span>
						<span>
							<div>
								Волосы: {{user.hairs}}
							</div>
							<div>
								Типаж: {{user.type}}
							</div>
						</span>
						<span>
							<div>
								Грудь: {{user.chest}}
							</div>
							<div>
								Талия: {{user.waist}}
							</div>
							<div>
								Бедра: {{user.huckle}}
							</div>
						</span>
						<label>
							Дата рождения:{{birth_date(user.birthDate)}}
						</label><br>
					</div>
				</span>
				</div>

				<h3>Мои фото</h3>
		<section>
			<div class="photos">
				<img ng-click="set_current(0);" ng-src="{{photos[0].image}}">
				<img ng-click="set_current(1);" ng-src="{{photos[1].image}}">
				<img ng-click="set_current(2);" ng-src="{{photos[2].image}}">
				<img ng-click="set_current(3);" ng-src="{{photos[3].image}}">
				<img ng-click="set_current(4);" ng-src="{{photos[4].image}}">
			</div>
		</section>
		<h3>Мои записи</h3>
		<section>
			<div
				class="create"
				ng-click="add_topic()"
				ng-if="options.user._id === user._id"
			>Добавить</div>
			<div class="record" ng-repeat="t in topics track by $index">
				<div class="record-area">
					<span class="record-text">text</span>
					<img src="" alt="ava">
				</div>
				<div class="comments">
					<div class="comment">
						<img src="" alt="guest">
						<span class="comment-author">asd</span>
						<span class="comment-text">text</span>
					</div>
					<div class="comment">
						<img src="" alt="guest">
						<span class="comment-author">asd</span>
						<span class="comment-text">text</span>
					</div>
					<div class="comment">
						<img src="" alt="guest">
						<span class="comment-author">asd</span>
						<span class="comment-text">text</span>
					</div>
				</div>
			</div>
			<form ng-submit="add_topic_comment($index)">
				<input type="text" placeholder="Введите комментарий">
			</form>
		</section>
			</div>
			<div class="ya-grid-1-5">
				<div class="ya-page__block">
					<span class="media">
						<div class="photo">
							<a href="#/user/{{user._id}}/photos/all">
							</a>
						</div>
						<div class="video">
							<a href="#/user/{{user._id}}/videos/all">
							</a>
						</div>
						<div class="favs">
							<a href="#/favs">
							</a>
						</div>
						<a href="#/dialogs" class="chat">
						</a>
					</span>

					<div class="social">
						Подписчики
						<div class="fb">
							<i class="fa fa-3x fa-facebook-official"></i>
							<span class="fa fa-2x">14</span>
						</div>
						<div class="vk">
							<i class="fa fa-3x fa-vk"></i>
							<span class="fa fa-2x">13</span>
						</div>
						<div class="gp">
							<i class="fa fa-3x fa-google-plus-official"></i>
							<span class="fa fa-2x">12</span>
						</div>
						<div class="tw">
							<i class="fa fa-3x fa-twitter-square"></i>
							<span class="fa fa-2x">11</span>
						</div>
					</div>
				</div>
			</div>
		</div>


		<section>
			<div ng-show="topic">
				<div class="create" ng-click="topic = null">Отменить</div>
				<textarea cols="30" rows="10" ng-model="topic.text"></textarea>
				<div class="create" ng-click="add_image();">Добавить картинки</div>
				<div class="photos">
					<span ng-repeat="i in topic.images">
						<img ng-src="{{i}}" alt="">
						<span ng-click="add_to_topic(i);">del</span>
					</span>
				</div>
				<div class="create" ng-click="new_topic();">Сохранить запись</div>
			</div>
		</section>
		<section ng-show="gallery.add_image">
			<div ng-click="gallery.add_image = null;">close</div>
			<div
				class="drop-box"
				ngf-multiple="true"
				ngf-pattern="'image/*'"
				ngf-drop="upload_files($files)"
				ngf-drag-over-class="'dragover'"
				ngf-select="upload_files($files)"
				ng-if="options.user._id === user._id"
			>
				Бросьте сюда картинки либо кликните
			</div>
			Или выбрать существующие
			<div class="photos">
				<img ng-src="{{p.image}}" alt="" ng-repeat="p in photos" ng-click="add_to_topic(p.image);">
			</div>
		</section>
		<section ng-hide="gallery.current === null">
			<div class="photo-area">
				<span
					class="left"
					ng-click="turn_left();"
				>
					&lt;
				</span>
				<span class="photo">
					<span ng-click="set_current(null)">X</span>
					<img ng-src="{{photos[gallery.current].image}}" ng-click="turn_right()">
					<span>
						<div>
							<div class="comment" ng-repeat="c in photos[gallery.current].comments">
								<a href="#/user/{{c.userid}}">{{c.name + ' ' + c.surname}}</a>:
								{{c.comment}}
								<i
									class="fa fa-lg fa-close"
									ng-if="c.userid === options.user._id"
									ng-click="remove_comment(gallery.current, c.comment)"
								></i>
							</div>
						</div>
						<input type="text" ng-model="gallery.comment">
						<button ng-click="add_comment(gallery.current)">&gt;</button>
					</span>
				</span>
				<span
					class="right"
					ng-click="turn_right()"
				>
					&gt;
				</span>
			</div>
		</section>
	</div>
</article>
