<article>
	<section>
		<h3>{{user.name}}</h3>
		<div class="ya-user__awards ya-sidebar-info ya-relative">
			<div class="ya-sidebar-info__icon ya-sidebar-info__icon_awards"></div>
			<div class="ya-page__block ya-page__block_rounded">
				<h2 class="ya-sidebar-info__title">
					Достижения
				</h2>
				<div class="ya-sidebar-info__content-wrapper" ng-repeat="a in user.achievements track by $index">
					<div ng-click="del_ac($index)">(x) удалить</div>
					<div class="ya-sidebar-info__content">
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Страна</span> {{a.country}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Город</span> {{a.city}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Год</span> {{a.year}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Название</span> {{a.title}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Место</span> {{a.place}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Комментарии</span> {{a.comment}}
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ya-user__work ya-sidebar-info ya-relative">
			<div class="ya-sidebar-info__icon ya-sidebar-info__icon_work"></div>
			<div class="ya-page__block ya-page__block_rounded">
				<h2 class="ya-sidebar-info__title">
					Работа
				</h2>
				<div class="ya-sidebar-info__content-wrapper" ng-repeat="w in user.workplaces track by $index">
					<div ng-click="del_wp($index)">(x) удалить</div>
					<div class="ya-sidebar-info__content">
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Страна</span> {{w.country}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Город</span> {{w.city}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Годы</span> {{w.year_start}} - {{w.year_end}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Компания</span> {{w.company}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Должность</span> {{w.speciality}}
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ya-user__edu ya-sidebar-info ya-relative">
			<div class="ya-sidebar-info__icon ya-sidebar-info__icon_edu"></div>
			<div class="ya-page__block ya-page__block_rounded">
				<h2 class="ya-sidebar-info__title">
					Образование
				</h2>
				<div class="ya-sidebar-info__content-wrapper" ng-repeat="u in user.universities track by $index">
					<div ng-click="del_un($index)">(x) удалить</div>
					<div class="ya-sidebar-info__content">
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Страна</span> {{u.country}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Город</span> {{u.city}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Годы</span> {{u.year_start}} - {{u.year_end}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Учреждение</span> {{u.university}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Факультет</span> {{u.faculty}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Кафедра</span> {{u.chair}}
						</div>
						<div class="ya-sidebar-info__item">
							<span class="ya-sidebar-info__label">Специальность</span> {{u.speciality}}
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</article>
