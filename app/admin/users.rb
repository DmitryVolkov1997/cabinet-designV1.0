ActiveAdmin.register User do

  config.xls_builder.i18n_scope = %i[activerecord attributes user]

  permit_params :all

  config.xls_builder.header_format = { weight: :bold,

                                       color: :blue }

  config.xls_builder.delete_columns :id, :created_at, :updated_at

  config.xls_builder.column('first_name') do |user|

    user.first_name

  end

  config.xls_builder.column('last_name') do |user|

    user.last_name

  end

  config.xls_builder.column('patronymic') do |user|

    user.patronymic

  end

  config.xls_builder.column('email') do |user|

    user.email

  end

  config.xls_builder.column('phone') do |user|

    user.phone

  end

  config.xls_builder.column('city') do |user|

    user.request.institution.city.name

  end

  config.xls_builder.column('institution_type') do |user|

    user.request.institution.institution_type.name

  end

  config.xls_builder.column('institution') do |user|

    user.request.institution.name

  end


  config.xls_builder.column('education_program') do |user|

    user.request.education_program.name

  end

  config.xls_builder.column('education_form') do |user|

    user.request.education_program.education_form.name

  end

  config.xls_builder.column('department') do |user|

    user.request.department.name

  end

  config.xls_builder.column('language') do |user|

    user.request.language.name

  end

  config.xls_builder.column('subject') do |user|

    user.request.subject.name

  end

end

