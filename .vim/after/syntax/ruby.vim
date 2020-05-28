let s:path = tr(expand('%:p'), '\', '/')

if s:path =~# '/app/models/.*\.rb$'
  syn keyword rubyCallback after_create after_destroy after_save after_update
  syn keyword rubyCallback after_commit after_create_commit after_update_commit after_save_commit after_destroy_commit after_rollback
  syn keyword rubyCallback after_find after_initialize after_touch
  syn keyword rubyCallback around_create around_destroy around_save around_update
  syn keyword rubyCallback before_create before_destroy before_save before_update
  syn keyword rubyCallback before_validation after_validation
  syn keyword rubyEntities has_many has_and_belongs_to_many
  syn keyword rubyEntity belongs_to has_one composed_of
  syn keyword rubyMacro accepts_nested_attributes_for attr_readonly attribute enum serialize store store_accessor
  syn keyword rubyMacro default_scope scope
  syn keyword rubyMacro validate has_secure_password has_secure_token has_one_attached has_many_attached
  syn keyword rubyValidation validates validates_acceptance_of validates_associated validates_confirmation_of validates_each validates_exclusion_of validates_format_of validates_inclusion_of validates_length_of validates_numericality_of validates_presence_of validates_absence_of validates_size_of validates_with
  syn keyword rubyValidation validates_associated validates_uniqueness_of
endif

if s:path =~# '/app/jobs/.*\.rb$'
  syn keyword rubyMacro queue_as
  syn keyword rubyExceptionMacro rescue_from retry_on discard_on
  syn keyword rubyCallback before_enqueue around_enqueue after_enqueue before_perform around_perform after_perform
endif

if s:path =~# '/app/controllers/.*\.rb$'
  syn keyword rubyHelper params request response session headers cookies flash
  syn keyword rubyMacro protect_from_forgery skip_forgery_protection
  syn match   rubyMacro '\<respond_to\>\ze[( ] *[:*]'
  syn match   rubyResponse '\<respond_to\>\ze[( ] *\%([&{]\|do\>\)'
  syn keyword rubyResponse render head redirect_to redirect_back respond_with send_data send_file
endif

if s:path =~# '/app/controllers/.*\.rb$\|/app/mailers/.*\.rb$\|/app/models/.*_mailer\.rb$'
  syn keyword rubyHelper render_to_string
  syn keyword rubyCallback before_action append_before_action prepend_before_action after_action append_after_action prepend_after_action around_action append_around_action prepend_around_action skip_before_action skip_after_action skip_action
  syn keyword rubyMacro helper helper_attr helper_method layout
  syn keyword rubyExceptionMacro rescue_from
endif

if s:path =~# '/app/mailers/.*\.rb$\|/app/models/.*_mailer\.rb$'
  syn keyword rubyResponse mail render
  syn match   rubyResponse "\<headers\>"
  syn match   rubyHelper "\<headers\[\@="
  syn keyword rubyHelper params attachments
  syn keyword rubyMacro default
  syn keyword rubyMacro register_interceptor register_interceptors register_observer register_observers
endif

if s:path =~# '/app/\w\+/concerns/.*\.rb$'
  syn keyword rubyMacro included class_methods
endif

if s:path =~# '/db/migrate/.*\.rb$\|/db/schema\.rb$'
  syn keyword rubySchema create_table change_table drop_table rename_table create_join_table drop_join_table
  syn keyword rubySchema create_schema drop_schema
  syn keyword rubySchema add_column rename_column change_column change_column_default change_column_null remove_column remove_columns
  syn keyword rubySchema add_foreign_key remove_foreign_key
  syn keyword rubySchema add_timestamps remove_timestamps
  syn keyword rubySchema add_reference remove_reference add_belongs_to remove_belongs_to
  syn keyword rubySchema add_index remove_index rename_index
  syn keyword rubySchema enable_extension reversible revert
  syn keyword rubySchema execute transaction
endif

if s:path =~# '/config/routes\>.*\.rb$'
  syn keyword rubyRoute resource resources collection member new nested shallow
  syn keyword rubyRoute match get put patch post delete root mount
  syn keyword rubyRoute scope controller namespace constraints defaults
  syn keyword rubyRoute concern concerns
  syn keyword rubyRoute direct resolve
  syn keyword rubyHelper redirect
endif

if s:path =~# '/test\%(/\|/.*/\)test_[^\/]*\.rb$\|/test/.*_test\.rb$\|/features/step_definitions/.*\.rb$'
  syn keyword rubyAssertion refute     refute_empty     refute_equal     refute_in_delta     refute_in_epsilon     refute_includes     refute_instance_of     refute_kind_of     refute_match    refute_nil     refute_operator     refute_predicate     refute_respond_to     refute_same
  syn keyword rubyAssertion assert     assert_empty     assert_equal     assert_in_delta     assert_in_epsilon     assert_includes     assert_instance_of     assert_kind_of     assert_match    assert_nil     assert_operator     assert_predicate     assert_respond_to     assert_same
  syn keyword rubyAssertion assert_not assert_not_empty assert_not_equal assert_not_in_delta assert_not_in_epsilon assert_not_includes assert_not_instance_of assert_not_kind_of assert_no_match assert_not_nil assert_not_operator assert_not_predicate assert_not_respond_to assert_not_same
  syn keyword rubyAssertion assert_raises         assert_send     assert_throws
  syn keyword rubyAssertion assert_nothing_raised assert_not_send assert_nothing_thrown
  syn keyword rubyAssertion assert_raise assert_block assert_mock assert_output assert_raise_with_message assert_silent
  syn keyword rubyAssertion flunk
endif

if s:path =~# '/spec/.*_spec\.rb$'
  syn match rubyTestHelper '\<subject\>'
  syn match rubyTestMacro '\<\%(let\|given\)\>!\='
  syn match rubyTestMacro '\<subject\>!\=\ze\s*\%([({&:]\|do\>\)'
  syn keyword rubyTestMacro before after around background setup teardown
  syn keyword rubyTestMacro context describe feature shared_context shared_examples shared_examples_for containedin=rubyKeywordAsMethod
  syn keyword rubyTestMacro it example specify scenario include_examples include_context it_should_behave_like it_behaves_like
  syn keyword rubyComment xcontext xdescribe xfeature containedin=rubyKeywordAsMethod
  syn keyword rubyComment xit xexample xspecify xscenario
endif

if s:path =~# '/spec/.*_spec\.rb$\|/features/step_definitions/.*\.rb$'
  syn keyword rubyAssertion pending skip expect is_expected expect_any_instance_of allow allow_any_instance_of
  syn keyword rubyTestHelper described_class
  syn keyword rubyTestHelper double instance_double class_double object_double
  syn keyword rubyTestHelper spy instance_spy class_spy object_spy
  syn keyword rubyTestAction stub_const hide_const
endif

syn keyword rubyAttribute class_attribute
syn keyword rubyAttribute attr_internal attr_internal_accessor attr_internal_reader attr_internal_writer
syn keyword rubyAttribute cattr_accessor cattr_reader cattr_writer mattr_accessor mattr_reader mattr_writer
syn keyword rubyAttribute thread_cattr_accessor thread_cattr_reader thread_cattr_writer thread_mattr_accessor thread_mattr_reader thread_mattr_writer
syn keyword rubyMacro alias_attribute concern concerning delegate delegate_missing_to with_options
