# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ballet_band = Band.create(name: 'Balett banda', url: 'example.org')

salsa_type = DanceType.create(name: 'Salsa', color: 'blue', image: 'nincs')
tango_type = DanceType.create(name: 'Tango', color: 'black', image: 'van')
hungarian_type = DanceType.create(name: 'Hungarian', color: 'red', image: 'lesz')
ballet_type = DanceType.create(name: 'ballet', color: 'purple', image: 'soselessz')

ballet_dance = Dance.create(
  name: 'Nagyon ballet',
  content: 'olyan jo, besirsz',
  dance_type_id: ballet_type.id
)

tango_dance = Dance.create(
  name: 'Nagyon tango',
  content: 'Legjobb tanc',
  dance_type_id: tango_type.id
)

hun_dance = Dance.create(
  name: 'Nagyon magyar',
  content: 'Meg az eddigieknel is jobb',
  dance_type_id: hungarian_type.id
)

salsa_dance = Dance.create(
  name: 'Nagyon salsa',
  content: 'ok_hand',
  dance_type_id: salsa_type.id
)

ballet_teacher = DanceTeacher.create(name: 'Joska Pista', url: 'example.org')
tango_teacher = DanceTeacher.create(name: 'Vak Béla', url: 'example.org/vakbel')
salsa_teacher = DanceTeacher.create(name: 'Elektrom Ágnes', url: 'example.org/')
hun_teacher = DanceTeacher.create(name: 'A B', url: 'example.org/adsf')

ballet_course = DanceCourse.create(
  dance_teacher_id: ballet_teacher.id,
  dance_id: ballet_dance.id,
  level: 'ez',
  length: '2'
)

tango_course = DanceCourse.create(
  dance_teacher_id: tango_teacher.id,
  dance_id: tango_dance.id,
  level: 'medium-rare',
  length: '4'
)

salsa_course = DanceCourse.create(
  dance_teacher_id: salsa_teacher.id,
  dance_id: salsa_dance.id,
  level: 'extreme hard',
  length: '1 fényév'
)

hun_course = DanceCourse.create(
  dance_teacher_id: hun_teacher.id,
  dance_id: hun_dance.id,
  level: 'medium',
  length: '45 perc'
)

ballet_party = Party.create(
  title: 'Balett party',
  photo: 'nincs',
  program: 'Van program',
  dance_course_id: ballet_course.id
)

salsa_party = Party.create(
  title: 'Balett party',
  photo: 'nincs',
  program: 'Van program',
  dance_course_id: salsa_course.id
)

tango_party = Party.create(
  title: 'Tango party',
  photo: 'nincs',
  program: 'Van program',
  dance_course_id: tango_course.id
)

hun_party = Party.create(
  title: 'Magyar party',
  photo: 'nincs',
  program: 'Van program',
  dance_course_id: hun_course.id
)

Workshop.create(
  title: 'Ballet workshop',
  photo: '',
  start_date: DateTime.now,
  end_date: DateTime.now,
  program: 'Egy jo program',
  content: 'Van tartalom',
  theme: 'Tema van',
  facebook_event: 'lesz',
  application_form: 'majd ez is lesz',
  party_id: ballet_party.id,
  dance_id: ballet_dance.id,
  dance_teacher_id: ballet_teacher.id
)

Workshop.create(
  title: 'Salsa workshop',
  photo: '',
  start_date: DateTime.now,
  end_date: DateTime.now,
  program: 'Egy jo program',
  content: 'Van tartalom',
  theme: 'Tema van',
  facebook_event: 'lesz',
  application_form: 'majd ez is lesz',
  party_id: salsa_party.id,
  dance_id: salsa_dance.id,
  dance_teacher_id: salsa_teacher.id
)

Workshop.create(
  title: 'Tango workshop',
  photo: '',
  start_date: DateTime.now,
  end_date: DateTime.now,
  program: 'Egy jo program',
  content: 'Van tartalom',
  theme: 'Tema van',
  facebook_event: 'lesz',
  application_form: 'majd ez is lesz',
  party_id: tango_party.id,
  dance_id: tango_dance.id,
  dance_teacher_id: tango_teacher.id
)

Workshop.create(
  title: 'Magyar tanc workshop',
  photo: '',
  start_date: DateTime.now,
  end_date: DateTime.now,
  program: 'Egy jo program',
  content: 'Van tartalom',
  theme: 'Tema van',
  facebook_event: 'lesz',
  application_form: 'majd ez is lesz',
  party_id: hun_party.id,
  dance_id: hun_dance.id,
  dance_teacher_id: hun_teacher.id
)
