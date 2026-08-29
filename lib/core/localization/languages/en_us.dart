/// English (United States) language translations
final Map<String, String> enUS = {
  'redemptionCode': 'Redemption Code',
  // Common
  'Balance After': 'Balance After',
  'app_name': 'NewPower',

  // Brand selection — first launch only.
  'brand_new_power': 'NewPower',
  'brand_osco': 'OSCO',
  'brand_smart_home': 'Smart Home',
  'brand_select_title': 'Choose your product line',
  'brand_select_subtitle':
      'This sets the logo and colours the app uses. It is chosen once and '
      'cannot be changed afterwards.',
  'brand_confirm_title': 'Confirm your choice',
  'brand_confirm_message':
      'The app will run as {brand}. This cannot be changed later — you would need to reinstall.',
  'welcome': 'Welcome',
  'loading': 'Loading...',
  'error': 'Error',
  'success': 'Success',
  'confirm': 'Confirm',
  'cancel': 'Cancel',
  // Bottom-nav tab labels (main_screen.dart). `projects_title` and
  // `products_title` live with their own features; these two have no
  // feature section of their own.
  'home': 'Home',
  'profile': 'Profile',
  'action_cancel': 'Cancel',
  'exit_app': 'Exit App',
  'exit_app_confirmation': 'Are you sure you want to exit the app?',
  'press_back_again_to_exit': 'Press back again to exit',
  'delete': 'Delete',
  'delete_document': 'Delete Document',
  'delete_document_confirm':
      'Are you sure you want to delete this document? You can upload it again if needed.',
  'continue': 'Continue',
  'skip': 'Skip',
  'next': 'Next',
  'back': 'Back',
  'logout': 'Logout',

  // Onboarding
  'onboarding_title_1': 'Start your journey toward bigger sales opportunities',
  'onboarding_subtitle_1':
      'Discover new construction projects early, log them into the system in seconds, and track their progress step by step through to the purchase decision — while keeping ownership of your projects protected from duplication.',
  'onboarding_title_2': 'Every visit makes a difference',
  'onboarding_subtitle_2':
      'Log visits, meetings, and calls, update project and construction stages, and pull up the product catalog and quotations right from the app, so every detail of your work stays organized and on record.',
  'onboarding_title_3': 'Track performance, decide with confidence',
  'onboarding_subtitle_3':
      'See your sales pipeline at a glance, get smart notifications, and use performance dashboards to stay on top of your targets, spot the projects that need attention, and deliver your best results.',
  'create_account': 'Create Account',
  'already_have_account': 'do not have an account? ',
  'login': 'Login',

  // Auth - Login
  'login_title': 'LOGIN',
  'email': 'Email',
  'email_hint': 'Enter your email..',
  'password': 'Password',
  'password_hint': 'Enter your password..',
  'forgot_password': 'Forgot password?',
  'dont_have_account': 'Don\'t have an account? ',
  'device_linked_info': 'Your device is linked to your account',
  'login_pending_approval':
      'Your account is waiting for your sales manager to approve it.',
  'login_role_not_allowed':
      'This app is for sales representatives only. Use the management console with this account.',
  'login_2fa_not_supported':
      'Two-factor authentication accounts must sign in through the admin console.',

  // Home shell (tabs)
  'home_dashboard_placeholder_title': 'Your dashboard is on its way',
  'home_dashboard_placeholder_subtitle':
      'Pipeline overview, today\'s visits and performance stats will show up here soon.',
  'projects_title': 'Projects',
  'projects_empty_title': 'No projects yet',
  'projects_empty_subtitle':
      'Projects you record will appear here so you can track them through to a decision.',
  'unit_meters_short': 'm',

  // Projects — list
  'projects_register_cta': 'Register',
  'projects_search_hint': 'Search by name or address',
  'projects_filter_all': 'All',
  'projects_list_error':
      'Couldn\'t load your projects. Check your connection and try again.',

  // Projects — register screen
  'projects_register_title': 'Register a Building',
  'projects_register_name': 'Building name',
  'projects_register_name_hint': 'e.g. Al Waha Residential Tower',
  'projects_register_name_error': 'Name must be 3-200 characters',
  'projects_register_building_type': 'Building type',
  'projects_register_building_type_hint': 'Select a building type',
  'projects_register_building_type_required': 'Select a building type',
  'projects_register_construction_phase': 'Construction phase',
  'projects_register_construction_phase_hint': 'Select the current phase',
  'projects_register_construction_phase_required':
      'Select the current construction phase',
  'projects_register_description': 'Description',
  'projects_register_description_hint':
      'A short description of the building and site',
  'projects_register_description_error':
      'Description must be 10-2000 characters',
  'projects_register_location': 'Location',
  'projects_register_location_cta': 'Tap to capture your current location',
  'projects_register_location_required':
      'Capture the building\'s location first',
  'projects_register_location_service_disabled':
      'Location services are turned off on this device',
  'projects_register_location_enable_cta': 'Enable location',
  'projects_register_location_permission_denied':
      'Location permission is required to register a building',
  'projects_register_location_error': 'Couldn\'t get your location. Try again',
  'projects_register_stage_hint': 'Select a stage',
  'projects_register_photos': 'Photos',
  'projects_register_photo_camera': 'Take a photo',
  'projects_register_photo_gallery': 'Choose from gallery',
  'projects_register_photo_required': 'Add at least one photo',
  'projects_register_photos_still_uploading':
      'Wait for the photos to finish uploading',
  'projects_register_address': 'Address',
  'projects_register_address_hint':
      'e.g. Al Mazzah Road, opposite the fire station',
  'projects_register_address_required':
      'Add a written address — a map pin alone is hard to find on site.',
  'projects_register_unit_count': 'Unit count',
  'projects_register_unit_count_hint': 'Number of units',
  'projects_register_estimated_value': 'Estimated value (SAR)',
  'projects_register_estimated_value_hint': 'Estimated deal value',
  'projects_register_estimated_value_required': 'Estimated value is required',
  'projects_register_estimated_value_invalid': 'Enter a valid amount',
  'projects_register_notes': 'Notes',
  'projects_register_notes_hint': 'Anything else worth recording',
  'projects_register_optional': '(optional)',
  'projects_register_submit': 'Register Building',
  'projects_register_nearby_confirm_title':
      'Is this building already registered?',
  'projects_register_nearby_confirm_subtitle':
      '{count} buildings are already recorded within 300 m of your pin. Check them before adding another — registering a duplicate creates work for whoever owns the other record.',
  'projects_register_nearby_confirm_cancel': 'Go back and check',
  'projects_register_nearby_confirm_proceed':
      'This is a different building — register it',
  'projects_register_duplicates_title': 'Similar buildings nearby',
  'projects_register_duplicates_subtitle':
      'Your building was registered. These nearby buildings might be the same one — check before working both.',
  'projects_register_duplicates_owner': 'Registered by',
  'projects_register_duplicates_continue': 'Continue',
  'projects_register_territory_rejected_title': 'Outside your territory',
  'projects_register_territory_rejected_message':
      'This location falls inside another representative\'s territory.',
  // {territory} comes from the server message — it is the only place the
  // territory name appears; no field on the error carries it.
  'projects_register_territory_rejected_named':
      'This location is in {territory}, which isn\'t one of the territories '
      'assigned to you.\n\n'
      'Move the pin inside your own area, or ask your manager to assign this '
      'territory to you.',

  // Projects — detail screen
  'projects_detail_not_found': 'This project isn\'t available anymore.',
  'projects_detail_error':
      'Couldn\'t load this project. Check your connection.',
  'projects_detail_photos': 'Photos',
  'projects_detail_outside_territory': 'Outside territory',
  // Activity attachments (§Workflow 1: photos, voice notes, PDF/Word)
  'attachment_add': 'Add attachment',
  'attachment_kind_image': 'Photo',
  'attachment_kind_audio': 'Voice note',
  'attachment_kind_document': 'Document',
  'attachment_source_document': 'Document (PDF / Word)',
  'attachment_source_voice': 'Record a voice note',
  'attachment_audio_unavailable': 'This recording could not be played',
  'attachment_open_failed': 'Nothing on this device can open that file',
  'voice_note_title': 'Voice note',
  'voice_note_discard': 'Discard',
  'voice_note_attach': 'Attach',
  'voice_note_permission_denied':
      'Microphone access is needed to record a voice note',
  'voice_note_too_short': 'That recording was too short',
  'voice_note_error': 'Recording failed. Try again',

  'projects_detail_section_basic': 'Basic information',
  'edit_project_cta': 'Edit',
  'edit_project_title': 'Edit project',
  'edit_project_submit': 'Save changes',
  'edit_project_saved': 'Changes saved',
  'edit_project_no_changes': 'Nothing has changed yet',
  'projects_detail_section_stakeholders': 'Stakeholders',
  'projects_detail_section_activities': 'Visits & activities',
  'projects_detail_section_stage_status': 'Stage & status',
  'projects_detail_section_images': 'Project images',
  'projects_detail_section_history': 'Project history',
  'projects_detail_section_outcome': 'Close the project',
  'projects_detail_closed_title': 'Project closed as {outcome}',
  'projects_detail_closed_subtitle':
      'The outcome has been confirmed, so this project is now a read-only record. Nothing can be added or edited.',
  'projects_detail_territory': 'Territory',
  'projects_detail_stage': 'Stage',
  'projects_detail_stage_terminal_note':
      'This project is closed. Reopening it requires a sales manager.',
  'projects_detail_status': 'Status',
  'projects_detail_set_dormant': 'Set Dormant',
  'projects_detail_set_cancelled': 'Cancel Project',
  'projects_detail_resume': 'Resume',
  'projects_detail_cancelled_note':
      'This project is cancelled. Reviving it requires a sales manager.',
  'projects_detail_status_reason_title': 'Why are you changing this?',
  'projects_detail_status_reason_hint': '10-500 characters',
  'projects_detail_status_reason_error': 'Enter 10-500 characters',
  'projects_register_images_not_uploaded':
      'One of your photos didn\'t save properly. Remove it and add it again, then submit.',
  'projects_detail_activities': 'Activity log',
  'projects_detail_activities_empty': 'No visits or calls logged yet.',
  'projects_detail_stakeholders': 'Stakeholders',
  'projects_detail_stakeholders_empty': 'No stakeholders linked yet.',
  'projects_detail_decision_maker': 'Decision maker',
  'projects_detail_history': 'History',
  'projects_detail_history_empty': 'No changes recorded yet.',
  'projects_detail_history_load_more': 'Load more',
  'projects_history_stage_entry': 'Stage changed to {stage}',
  'projects_history_status_entry': 'Status changed to {status}',
  'projects_version_conflict_title': 'This project changed',
  'projects_version_conflict_message':
      'Someone else updated this project since you opened it. Refresh to see the latest before trying again.',
  'projects_version_conflict_refresh': 'Refresh',
  'projects_last_image_required':
      'A project must have at least one photo — add another before removing this one.',

  // Project stages (funnel order)
  'project_stage_lead': 'Lead',
  'project_stage_qualified': 'Qualified',
  'project_stage_engagement': 'Engagement',
  'project_stage_approval': 'Approval',
  'project_stage_boq_received': 'BOQ Received',
  'project_stage_quote_issued': 'Quote Issued',
  'project_stage_committed': 'Committed',
  'project_stage_won': 'Won',
  'project_stage_lost': 'Lost',

  // Project status
  'project_status_active': 'Active',
  'project_status_dormant': 'Dormant',
  'project_status_cancelled': 'Cancelled',

  // Building types
  'building_type_apartment_building': 'Apartment Building',
  'building_type_villa': 'Villa',
  'building_type_residential_complex': 'Residential Complex',
  'building_type_commercial': 'Commercial',
  'building_type_mixed_use': 'Mixed Use',
  'building_type_industrial': 'Industrial',
  'building_type_hospitality': 'Hospitality',
  'building_type_healthcare': 'Healthcare',
  'building_type_educational': 'Educational',
  'building_type_government': 'Government',
  'building_type_religious': 'Religious',
  'building_type_infrastructure': 'Infrastructure',
  'building_type_other': 'Other',

  // Construction phases
  'construction_phase_planning': 'Planning',
  'construction_phase_excavation': 'Excavation',
  'construction_phase_foundation': 'Foundation',
  'construction_phase_structure': 'Structure',
  'construction_phase_blockwork': 'Blockwork',
  'construction_phase_electrical_rough_in': 'Electrical Rough-In',
  'construction_phase_plastering': 'Plastering',
  'construction_phase_finishing': 'Finishing',
  'construction_phase_electrical_fit_out': 'Electrical Fit-Out',
  'construction_phase_handover': 'Handover',
  'construction_phase_completed': 'Completed',

  // Stakeholder roles (read-only in Phase 1 — full directory is Phase 6)
  'stakeholder_role_owner': 'Owner',
  'stakeholder_role_main_contractor': 'Main Contractor',
  'stakeholder_role_electrical_mep_subcontractor':
      'Electrical/MEP Subcontractor',
  'stakeholder_role_consultant_engineering_office':
      'Consultant Engineering Office',
  'stakeholder_role_purchasing_manager': 'Purchasing Manager',
  'stakeholder_role_site_electrician': 'Site Electrician',
  'stakeholder_role_electrical_engineer': 'Electrical Engineer',
  'stakeholder_role_site_supervisor': 'Site Supervisor',
  'stakeholder_role_other': 'Other',

  // Phase 2 — Activities
  'projects_detail_log_activity': 'Log activity',
  'projects_detail_work_stopped_default_reason': 'Work stopped on site.',
  'projects_detail_set_dormant_prompt_title': 'Park this project?',
  'projects_detail_set_dormant_prompt_message':
      'Work has stopped on this site. Setting it to Dormant keeps it out of your active pipeline until it picks back up.',
  'log_activity_title': 'Log Activity',
  'log_activity_kind_visit': 'Visit',
  'log_activity_kind_communication': 'Communication',
  'log_activity_channel': 'Channel',
  'log_activity_channel_hint': 'How did you reach them?',
  'log_activity_channel_required': 'Select a channel',
  'log_activity_purpose': 'Purpose',
  'log_activity_purpose_hint': 'Select a purpose',
  'log_activity_purpose_required': 'Select a purpose',
  'log_activity_outcome': 'Outcome',
  'log_activity_outcome_hint': 'Select an outcome',
  'log_activity_outcome_required': 'Select an outcome',
  'log_activity_occurred_at': 'When did this happen?',
  'log_activity_occurred_at_hint': 'Select date and time',
  'log_activity_next_action': 'When will you follow up?',
  'log_activity_next_action_hint': 'Select date and time',
  'log_activity_next_action_required':
      'Set a follow-up date — you picked "too early, revisit later"',
  'log_activity_notes': 'Notes',
  'log_activity_notes_hint': 'What happened, in at least 20 characters',
  'log_activity_notes_error': 'Notes must be 20-4000 characters',
  'log_activity_persons_visit': 'Who did you meet? (at least one)',
  'log_activity_person_communication': 'Who did you speak with?',
  // Read-only detail view states a fact; the form above asks a question.
  // Separate keys so neither has to be phrased awkwardly for both uses.
  'activity_detail_persons_visit': 'People you met',
  'activity_detail_person_communication': 'Person you spoke with',
  'log_activity_persons_required': 'Select at least one person',
  'log_activity_persons_empty':
      'No contacts are linked to this project yet. Add a stakeholder to record who you met.',
  'log_activity_add_stakeholder': 'Add a stakeholder',
  'log_activity_stage': 'Project stage',
  'log_activity_stage_will_change':
      'The project stage will move from {from} to {to} when you save.',
  'log_activity_location': 'Location',
  'log_activity_location_cta': 'Tap to capture your current location',
  'log_activity_construction_phase_observed': 'Construction phase observed',
  'log_activity_construction_phase_hint': 'Select the phase you observed',
  'log_activity_attachments': 'Attachments',
  'log_activity_submit': 'Log Activity',
  'activity_detail_title': 'Activity',
  'activity_detail_not_found': 'This activity isn\'t available anymore.',
  'activity_detail_error':
      'Couldn\'t load this activity. Check your connection.',
  'activity_detail_backdated': 'Backdated',
  'activity_detail_edited_after_window': 'Edited later',
  'activity_detail_competitor': 'Competitor',
  'activity_detail_location_unverified': '(unverified)',
  'activity_detail_revisions': 'Edit history',
  'activity_detail_edit_cta': 'Edit',
  'activity_detail_edit_title': 'Edit Activity',
  'activity_detail_edit_saved': 'Activity updated',
  'activity_detail_late_edit_warning':
      'This activity was logged over 24 hours ago — your manager will see this change.',

  // Activity kind/channel/purpose/outcome
  'activity_kind_visit': 'Visit',
  'activity_kind_communication': 'Communication',
  'activity_channel_phone_call': 'Phone Call',
  'activity_channel_whatsapp': 'WhatsApp',
  'activity_channel_email': 'Email',
  'activity_channel_sms': 'SMS',
  'activity_channel_other': 'Other',
  'activity_purpose_discovery': 'Discovery',
  'activity_purpose_samples': 'Samples',
  'activity_purpose_catalog': 'Catalog',
  'activity_purpose_quantities': 'Quantities',
  'activity_purpose_price_quote': 'Price Quote',
  'activity_purpose_negotiation': 'Negotiation',
  'activity_purpose_follow_up': 'Follow-up',
  'activity_purpose_gift': 'Gift',
  'activity_purpose_other': 'Other',
  'activity_outcome_progressing': 'Progressing',
  'activity_outcome_needs_another_visit': 'Needs another visit',
  'activity_outcome_waiting_on_them': 'Waiting on them',
  'activity_outcome_awaiting_quantities': 'Awaiting quantities',
  'activity_outcome_competitor_on_site': 'Competitor on site',
  'activity_outcome_decision_imminent': 'Decision imminent',
  'activity_outcome_no_one_present': 'No one present',
  'activity_outcome_work_stopped': 'Work stopped',
  'activity_outcome_too_early_revisit_later': 'Too early — revisit later',
  'attention_reason_follow_up_due': 'Follow-up due',
  'attention_reason_awaiting_them': 'Awaiting them',
  'attention_reason_stage_without_evidence': 'Stage without evidence',
  'attention_reason_no_activity': 'No activity',

  'outcome_type_won': 'Won',
  'outcome_type_lost': 'Lost',
  'outcome_status_pending': 'Pending',
  'outcome_status_confirmed': 'Confirmed',
  'outcome_status_rejected': 'Rejected',
  'loss_reason_price': 'Price',
  'loss_reason_payment_terms': 'Payment terms',
  'loss_reason_availability': 'Availability',
  'loss_reason_spec_mismatch': 'Spec mismatch',
  'loss_reason_competitor_relationship': 'Competitor relationship',
  'loss_reason_consultant_specified_competitor':
      'Consultant specified competitor',
  'loss_reason_late_engagement': 'Late engagement',
  'loss_reason_outlet_did_not_stock': 'Outlet did not stock',
  'loss_reason_other': 'Other',
  'product_category_sockets_switches': 'Sockets & switches',
  'product_category_lighting': 'Lighting',
  'product_category_exhaust_fans': 'Exhaust fans',
  'product_category_cables': 'Cables',
  'product_category_distribution_boards': 'Distribution boards',
  'product_category_circuit_breakers': 'Circuit breakers',
  'product_category_conduit_trunking': 'Conduit & trunking',
  'product_category_accessories': 'Accessories',
  'product_category_other': 'Other',

  'projects_detail_outcome': 'Outcome',
  'projects_detail_mark_as_lost': 'Mark as lost',

  'submit_outcome_title': 'Record project outcome',
  'submit_outcome_lost_notice':
      'This records why this project was lost. It cannot be undone from here — you can only withdraw the submission while it\'s pending.',
  'submit_outcome_reason': 'Reason',
  'submit_outcome_reason_hint': 'Select a reason',
  'submit_outcome_reason_required': 'Please select a reason',
  'submit_outcome_competitor_price': 'Competitor price',
  'submit_outcome_competitor_price_hint': 'Enter the competitor\'s price',
  'submit_outcome_price_required':
      'Competitor price is required for this reason',
  'submit_outcome_competitor': 'Competitor',
  'submit_outcome_competitor_hint': 'Search for a company (optional)',
  'submit_outcome_competitor_not_found':
      'That account isn\'t a registered competitor',
  'submit_outcome_loss_requires_winner':
      'If nobody won, cancel the project instead of marking it lost',
  'submit_outcome_narrative': 'Narrative',
  'submit_outcome_narrative_hint': 'What happened? (optional)',
  'submit_outcome_notes': 'Notes',
  'submit_won_files': 'Supporting documents',
  'submit_outcome_notes_hint': 'Additional notes (optional)',
  'submit_outcome_submit': 'Submit',
  'submit_outcome_text_too_long': 'Cannot exceed 2000 characters',
  'submit_outcome_already_open': 'This project already has an open outcome',
  'submit_outcome_project_cancelled':
      'This project is cancelled and can no longer be closed',

  'submit_won_notice':
      'This records the sale that closed this project. Confirmation still needs a different manager to sign off.',
  'submit_won_distributor': 'Distributor',
  'submit_won_distributor_hint': 'Search for a company',
  'submit_won_distributor_required': 'Please choose a distributor',
  'submit_won_distributor_not_found':
      'That account isn\'t a registered distributor',
  'submit_won_buyer_contact': 'Buyer contact',
  'submit_won_buyer_contact_hint': 'Who signed?',
  'submit_won_value': 'Sale value',
  'submit_won_value_hint': 'Amount',
  'submit_won_sold_at': 'Sold on',
  'submit_won_sold_at_hint': 'Select a date',
  'submit_won_categories': 'Product categories',
  'submit_won_units_supplied': 'Units supplied',
  'submit_won_units_total': 'Units total',
  'submit_won_units_exceed_total': 'Units supplied cannot exceed units total',
  'submit_won_buyer_contact_required': 'Select the buyer contact',
  'submit_won_sold_at_required': 'Select the sale date',
  'submit_won_categories_required': 'Select at least one product category',
  'submit_outcome_field_required': 'This field is required',
  'submit_outcome_invalid_amount': 'Enter an amount greater than zero',
  'submit_outcome_invalid_count': 'Enter a valid number',

  'projects_detail_outcome_pending_title':
      'A {type} request is awaiting review',
  'projects_detail_outcome_pending_lock':
      'You cannot submit another outcome until your manager decides on this '
      'one.',
  'projects_detail_outcome_pending_open': 'View the request',
  'projects_detail_outcome_submitted_at': 'Submitted on',

  'projects_detail_mark_as_won': 'Mark as won',
  'projects_detail_submit_outcome': 'Submit project outcome',

  'outcome_detail_title': 'Outcome',
  'outcome_detail_not_found': 'This outcome could not be found',
  'outcome_detail_error': 'Something went wrong loading this outcome',
  'outcome_detail_competitor': 'Competitor',
  'outcome_detail_competitor_unknown': 'Unknown',
  'outcome_detail_distributor': 'Distributor',
  'outcome_detail_value': 'Value',
  'outcome_detail_units': 'Units supplied / total',
  'outcome_detail_submitted_at': 'Submitted at',
  'outcome_detail_rejection_reason': 'Rejection reason',
  'outcome_detail_withdraw_title': 'Withdraw submission',
  'outcome_detail_withdraw_hint': 'Why are you withdrawing this?',
  'outcome_detail_withdraw_error': 'Reason must be 10–500 characters',
  'outcome_detail_withdraw_cta': 'Withdraw',
  'outcome_detail_withdrawn': 'Submission withdrawn',
  'outcome_detail_submit_again_cta': 'Submit again',

  'outcomes_list_title': 'My outcomes',
  'outcomes_list_empty_title': 'No outcomes yet',
  'outcomes_list_empty_subtitle':
      'Outcomes you submit for your projects will show up here.',
  'outcomes_list_error': 'Something went wrong loading your outcomes',

  'profile_my_outcomes': 'My outcomes',

  // Account self-service (users.md `/users/me/*`)
  'change_password_title': 'Change password',
  'change_password_current': 'Current password',
  'change_password_current_hint': 'Enter your current password',
  'change_password_current_required': 'Enter your current password',
  'change_password_incorrect_current': 'That password is not correct',
  'change_password_new': 'New password',
  'change_password_new_hint': 'At least 8 characters',
  'change_password_confirm': 'Confirm new password',
  'change_password_confirm_hint': 'Re-enter the new password',
  'change_password_logout_others': 'Sign out other devices',
  'change_password_logout_others_hint':
      'Everywhere else you are signed in will be signed out. This device stays signed in.',
  'change_password_same': 'The new password must differ from the current one',
  'change_password_submit': 'Save password',
  'change_password_success': 'Password changed',

  'change_username_title': 'Change username',
  'change_username_current': 'Current username',
  'change_username_new': 'New username',
  'change_username_new_hint': 'e.g. ahmad123456',
  'change_username_rules':
      '6–30 characters, lowercase letters and digits only.',
  'change_username_length_error': 'Username must be 6–30 characters',
  'change_username_format_error':
      'Use lowercase letters and digits only, with no spaces',
  'change_username_permanent':
      'You can change your username only once, and it cannot be undone.',
  'change_username_taken': 'That username is already taken',
  'change_username_already_changed':
      'You have already used your one username change',
  'change_username_submit': 'Save username',
  'change_username_success': 'Username updated',
  'profile_offline_queue': 'Pending sync',

  'log_activity_saved_offline':
      'No connection — saved on your device. It will sync automatically.',

  'offline_queue_title': 'Pending sync',
  'offline_queue_empty_title': 'Nothing waiting to sync',
  'offline_queue_empty_subtitle':
      'Activities you log while offline will appear here until they sync.',
  'offline_queue_sync_now': 'Sync now',
  'offline_queue_sync_success': 'Synced — {count} activities up to date',
  'offline_queue_sync_failed':
      'Still no connection — will retry automatically.',

  // Stakeholders (Phase 6) — stakeholders.md
  'account_type_company': 'Company',
  'account_type_individual': 'Individual',

  'account_picker_title': 'Find a company',
  'account_picker_search_hint': 'Search by name, city, phone or email',
  'account_picker_create_cta': 'Add new account',
  'account_picker_prompt_title': 'Search the directory',
  'account_picker_prompt_subtitle':
      'Type a name, city, phone or email to find a company.',
  'account_picker_empty_title': 'No matches',
  'account_picker_empty_subtitle':
      'Nobody in the directory matches that search — add them instead.',
  'account_picker_unverified': 'Unverified',
  'account_picker_classify_as': 'Mark as {classification}',
  'account_classification_project_stakeholder': 'Project stakeholder',
  'account_classification_distributor': 'Distributor',
  'account_classification_competitor': 'Competitor',

  'register_account_title': 'Add a company',
  'register_account_name': 'Name',
  'register_account_name_hint': 'Company or individual name',
  'register_account_name_error': 'Name must be 2-200 characters',
  'register_account_type': 'Type',
  'register_account_type_hint': 'Select a type',
  'register_account_registration_number': 'Registration number',
  'register_account_registration_number_hint': 'Commercial registration',
  'register_account_phone': 'Phone',
  'register_account_phone_hint': 'Phone number',
  'register_account_email': 'Email',
  'register_account_email_hint': 'Email address',
  'register_account_city': 'City',
  'register_account_city_hint': 'City',
  'register_account_address': 'Address',
  'register_account_address_hint': 'Street, building, area',
  'register_account_notes': 'Notes',
  'register_account_notes_hint': 'Anything worth remembering',
  'register_account_submit': 'Save',

  'contact_picker_title': 'Choose a contact',
  'contact_picker_add_cta': 'Add new contact',
  'contact_picker_empty_title': 'No contacts yet',
  'contact_picker_empty_subtitle':
      'Contacts you add for this company will appear here.',
  'contact_picker_primary': 'Primary',
  'contact_edit_title': 'Edit contact',
  'contact_action_edit': 'Edit details',
  'contact_action_decision_maker': 'Make decision maker',
  'contact_saved': 'Contact saved',
  'stakeholder_action_contacts': 'View contacts',
  'decision_maker_set_done': 'Decision maker updated',

  'add_contact_title': 'Add a contact',
  'add_contact_first_name': 'First name',
  'add_contact_first_name_hint': 'First name',
  'add_contact_last_name': 'Last name',
  'add_contact_last_name_hint': 'Last name',
  'add_contact_name_error': 'Required',
  'add_contact_position': 'Position',
  'add_contact_position_hint': 'e.g. Purchasing Manager',
  'add_contact_phone': 'Phone',
  'add_contact_phone_hint': 'Phone number',
  'add_contact_email': 'Email',
  'add_contact_email_hint': 'Email address',
  'add_contact_is_primary': 'Primary contact for this company',
  'add_contact_submit': 'Save',

  'add_stakeholder_cta': 'Add',
  'add_stakeholder_title': 'Add a stakeholder',
  'add_stakeholder_person_name': 'Name',
  'add_stakeholder_company_name': 'Company / customer',
  'add_stakeholder_company_new': 'New company',
  'add_stakeholder_company_name_hint': 'Who do they work for?',
  'add_stakeholder_account': 'Company',
  'add_stakeholder_account_hint': 'Search for a company',
  'add_stakeholder_account_required': 'Please choose a company',
  'add_stakeholder_role': 'Role',
  'add_stakeholder_role_hint': 'Select a role',
  'add_stakeholder_role_required': 'Please select a role',
  'add_stakeholder_primary_contact': 'Primary contact',
  'add_stakeholder_primary_contact_hint': 'Select a contact',
  'add_stakeholder_note': 'Note',
  'add_stakeholder_note_hint': 'Anything worth remembering',
  'add_stakeholder_submit': 'Add stakeholder',

  'edit_stakeholder_title': 'Edit stakeholder',
  'edit_stakeholder_submit': 'Save changes',

  'stakeholder_action_edit': 'Edit',
  'stakeholder_action_replace': 'Replace company',
  'stakeholder_action_close': 'Close involvement',
  'stakeholder_close_title': 'Close this involvement',
  'stakeholder_close_hint': 'Why is this involvement ending?',
  'stakeholder_close_error': 'Reason must be 10-500 characters',
  'stakeholder_close_cta': 'Close',

  'replace_stakeholder_title': 'Replace stakeholder',
  'replace_stakeholder_outgoing': 'Replacing {account} as {role}',
  'replace_stakeholder_account_required': 'Please choose a company',
  'replace_stakeholder_new_account': 'New company',
  'replace_stakeholder_new_account_hint': 'Search for a company',
  'replace_stakeholder_new_contact': 'New primary contact',
  'replace_stakeholder_new_contact_hint': 'Select a contact',
  'replace_stakeholder_note': 'Note',
  'replace_stakeholder_note_hint': 'Anything worth remembering',
  'replace_stakeholder_reason': 'Reason',
  'replace_stakeholder_reason_hint': 'Why is this company being replaced?',
  'replace_stakeholder_reason_error': 'Reason must be 10-500 characters',
  'replace_stakeholder_submit': 'Replace',

  'decision_maker_empty': 'No decision maker set yet',
  'decision_maker_needs_stakeholder':
      'Add a stakeholder first — a decision maker must be someone at a linked company',
  'decision_maker_set_cta': 'Set decision maker',
  'decision_maker_change_cta': 'Change decision maker',
  'decision_maker_remove_cta': 'Remove',
  'decision_maker_remove_title': 'Remove decision maker',
  'decision_maker_remove_hint': 'Why are you removing this flag?',
  'decision_maker_remove_error': 'Reason must be 10-500 characters',
  'decision_maker_move_reason_title': 'Why the change?',
  'decision_maker_move_reason_hint':
      'Moving from one decision maker to another needs a reason',
  'decision_maker_move_reason_error': 'Reason must be 10-500 characters',
  'decision_maker_history_cta': 'History',
  'decision_maker_history_title': 'Decision maker history',
  'decision_maker_history_current': 'Current',
  'decision_maker_history_empty_title': 'No history yet',
  'decision_maker_history_empty_subtitle':
      'Every decision maker this project has had will show up here.',

  'products_title': 'Products',
  'products_empty_title': 'No products yet',
  'products_empty_subtitle':
      'The product catalog will appear here so you can browse it during visits and quotes.',

  // User roles (GET /auth/me `role`)
  'role_representative': 'Representative',
  'role_sales_manager': 'Sales Manager',
  'role_sales_admin': 'Sales Admin',
  'role_general_manager': 'General Manager',

  // Auth - Register
  'register_title': 'CREATE ACCOUNT',
  'create_new_account': 'Create New Account',
  'first_name': 'First Name',
  'first_name_hint': 'First Name',
  'last_name': 'Last Name',
  'last_name_hint': 'Last Name',
  'full_name': 'Full Name',
  'full_name_hint': 'Enter your full name..',
  'phone_number': 'Phone Number',
  'phone_number_hint': 'Enter your phone number..',
  'confirm_password': 'Confirm Password',
  'confirm_password_hint': 'Enter your password..',
  'manager_code': 'Manager Code',
  'manager_code_hint': 'e.g. SM-7K3FQ9YD',
  'register': 'Register',
  'already_registered': 'Already registered? ',

  // Auth - Forgot Password
  'forgot_password_title': 'Forgot your password',
  'forgot_password_desc':
      'Enter your email address and we\'ll send you a reset code',
  'send_reset_code': 'Send Reset Code',
  'back_to_login': 'Back to login',

  // Auth - Reset Password
  'reset_password_title': 'Reset Password',
  'reset_password_desc': 'Enter the reset code sent to your email',
  'reset_code_hint': 'Enter reset code..',
  'verification_code': 'Verification Code',
  'new_password': 'New Password',
  'new_password_hint': 'Enter new password..',
  'confirm_new_password': 'Confirm New Password',
  'confirm_new_password_hint': 'Re-enter new password..',
  'reset_password': 'Reset Password',

  // Auth - Email Verification
  'verify_email_title': 'Verify Your Email',
  'verify_email_desc': 'We\'ve sent a 6-digit code to',
  'enter_code': 'Enter the code below to verify your email',
  'verify_email': 'Verify Email',
  'resend_code': 'Resend code in',
  'seconds': 'seconds',
  'error_start_before_end': 'Start date must be before end date',
  'change_email': 'Change email address',

  // Auth - Device Verification
  'verify_device_title': 'Verify Your Device',
  'enter_code_device': 'Enter the code below to verify your device',
  'verify_device': 'Verify Device',
  'verify_device_message':
      'New device detected. A verification code has been sent to your email',
  // Home
  'home_title': 'E-Wallet',
  'welcome_message': 'Welcome to E-Wallet',
  'auth_success': 'You have successfully authenticated!',
  'user_information': 'User Information',
  'switch_language': 'Switch Language',
  'theme_settings': 'Theme Settings',
  'light_mode': 'Light Mode',
  'dark_mode': 'Dark Mode',
  'system_default': 'System Default',
  'follows_device': 'Follows device settings',

  // Password Strength
  'password_strength': 'Password Strength',
  'weak': 'Weak',
  'fair': 'Fair',
  'good': 'Good',
  'strong': 'Strong',

  // Validation Messages
  'error_empty_email': 'Email is required',
  'error_invalid_email': 'Invalid email address',
  'error_empty_password': 'Password is required',
  'error_password_too_short': 'Password must be at least 8 characters',
  'error_password_uppercase':
      'Password must contain at least one uppercase letter',
  'error_password_lowercase':
      'Password must contain at least one lowercase letter',
  'error_password_digit': 'Password must contain at least one number',
  'error_password_special':
      'Password must contain at least one special character',
  'error_password_too_long': 'Password must not exceed 128 characters',
  'error_password_repeated_chars':
      'Password must not contain 4 or more identical characters in a row',
  'error_password_mismatch': 'Passwords do not match',
  'error_confirm_password_required': 'Password confirmation is required',
  'error_empty_name': 'Name is required',
  'error_name_too_short': 'Name must be\n at least 3 \ncharacters',
  'error_empty_phone': 'Phone number is required',
  'error_invalid_phone': 'Please enter a valid phone number',
  'error_empty_pin': 'Please enter the 6-digit code',

  // Messages
  'device_not_registered': 'Device not registered. Please restart the app.',
  'device_not_valid': 'Device not valid. Please restart the app.',
  'login_success': 'Login successful',
  'register_success': 'Account created! Please verify your email to continue',
  'code_sent': 'If the Email is valid, a verification code will be sent',
  'password_reset_success':
      'Password updated! You can now log in with your new password',
  'email_verified': 'Email verified! You can now log in to your account',
  'code_resent': 'A new verification code has been sent to your email',

  // API Error Messages - Network
  'error_connection_timeout': 'Connection timeout. Please try again',
  'error_send_timeout': 'Request timeout. Please try again',
  'error_receive_timeout': 'Server response timeout. Please try again',
  'error_request_cancelled': 'Request was cancelled',
  'error_no_internet': 'No internet connection. Please check your connection',
  'error_unexpected': 'An unexpected error occurred. Please try again',
  'error_parse': 'Error processing response',
  'error_unknown': 'An unknown error occurred',
  'error_server_unavailable':
      'Service temporarily unavailable. Please try again later',

  // Startup Error Screen — generic app-startup failures, not auth-specific
  'startup_connection_failed': 'Failed to connect to server',
  'startup_check_internet_retry':
      'Check your internet connection and try again',
  'startup_no_internet': 'No Internet Connection',
  'startup_no_internet_subtitle':
      "You're offline. Check your Wi-Fi or mobile data and try again.",
  'startup_server_unreachable': 'Server Unavailable',
  'startup_server_unreachable_subtitle':
      "We can't reach our servers right now. Please try again in a few moments.",
  'startup_initialization_failed': 'Couldn\'t Start the App',
  'startup_initialization_failed_subtitle':
      'Something went wrong while starting up. Please try again.',
  'startup_unknown_error': 'Something Went Wrong',
  'startup_unknown_error_subtitle':
      'An unexpected error occurred. Please try again.',
  'startup_retry': 'Retry',
  'startup_rate_limited': 'Too Many Attempts',
  'startup_rate_limited_subtitle': 'Please wait {seconds}s before retrying.',

  // API Error Messages - Auth & Validation (400)
  'error_validation': 'Invalid data provided',
  'error_invalid_device_token': 'Device token is invalid or expired',
  'error_device_already_linked':
      'This device is already linked to another account',
  'error_max_devices_reached': 'Maximum number of devices reached',
  'error_invalid_reset_code': 'Invalid or expired reset code',
  'error_invalid_manager_code':
      'That manager code is not valid. Check it with your sales manager.',
  'error_device_id_mismatch':
      'This device no longer matches your session. Please login again.',
  'error_account_locked': 'Too many failed attempts. Please try again later.',

  // API Error Messages - Authentication (401)
  'error_invalid_credentials': 'Invalid email or password',
  'error_invalid_token': 'Invalid authentication token',
  'error_token_expired': 'Session expired. Please login again',
  'error_token_revoked': 'Session expired. Please try again',
  'error_upload_retry_needed':
      'Session was refreshed during upload. Please try uploading again.',
  'error_token_reuse_detected':
      'Security violation detected. Please login again',
  'error_account_banned': 'Your account has been banned',
  'error_account_suspended': 'Your account has been suspended',

  // API Error Messages - Authorization (403)
  'error_forbidden': 'You are not authorized to perform this action',

  // API Error Messages - Not Found (404)
  'error_not_found': 'Resource not found',

  // API Error Messages - Conflict (409)
  'error_duplicate_email': 'This email is already registered',
  'error_duplicate_phone': 'This phone number is already registered',

  // API Error Messages - Rate Limiting (429)
  'error_too_many_requests': 'Too many requests. Please try again later',

  // Per-screen rate-limit countdowns. `{seconds}` is substituted by the
  // calling screen from the server's Retry-After header.
  //
  // These five are consumed by login_screen, register_screen,
  // email_verification_screen, forgot_password_screen and
  // reset_password_screen. They existed only in ar_sy.dart, and
  // AppLocalizations.translate returns the raw key on a miss — so an
  // English user who tripped a rate limit was shown the literal text
  // "error_rate_limited_login".
  'error_rate_limited_login':
      'Too many failed attempts. Try again in {seconds} seconds.',
  'error_rate_limited_otp':
      'Too many incorrect attempts. Try again in {seconds} seconds.',
  'error_rate_limited_register':
      'Too many failed attempts. Try again in {seconds} seconds.',
  'error_rate_limited_forgot_password':
      'Too many requests. Try again in {seconds} seconds.',
  'error_rate_limited_reset_password':
      'Too many failed attempts. Try again in {seconds} seconds.',
  'error_rate_limited_pin_setup':
      'Too many failed attempts. Try again in {seconds} seconds.',

  // Relative-time units. `time_ago_pattern` composes {n} with one of the
  // unit words below; the `time_*_two` family elsewhere in this file handles
  // Arabic's dual, which English does not have.
  'ago': 'ago',
  'time_ago_pattern': '{n} {unit} ago',
  'minute': 'minute',
  'minutes': 'minutes',
  'minutes_ago': '{n} minutes ago',
  'hour': 'hour',
  'hours': 'hours',
  'hours_ago': '{n} hours ago',
  'day': 'day',
  'days': 'days',
  'days_ago': '{n} days ago',
  'unknown': 'Unknown',

  'back_home': 'Back to home',
  'logout_confirm': 'Are you sure you want to log out?',

  // Account deletion — the Arabic side of these already existed. Wired up
  // when the deletion endpoint lands (finding B13).
  'delete_account': 'Delete account',
  'cancel_delete_account': 'Cancel account deletion',

  // Offline queue — suspended behind FeatureFlags.offlineSyncEnabled.
  'offline_queue_full':
      'Could not queue the request. Please retry when you are online.',

  // API Error Messages - Conflict (409)
  //
  // Mapped from the CONFLICT error code in ApiErrorHandler._getErrorKeyFromCode.
  //
  // The wallet/KYC/P2P-transfer strings that used to sit here came from the
  // e-wallet app this project was forked from. NewPower has no wallet, no
  // balance and no transfers — none of those keys were reachable from any
  // error code this API produces, so they have been removed rather than
  // translated.
  'error_duplicate_request': 'This request has already been processed',

  // Settings
  'settings_title': 'Settings',
  'security_section': 'Security',
  'screenshot_protection': 'Screenshot Protection',
  'screenshot_protection_desc':
      'By enabling the screen capture option, you assume full responsibility for any unauthorized disclosure or sharing of the content displayed within the application',

  // Profile - Change Password
  'change_password': 'Change Password',
  'current_password': 'Current Password',
  'error_current_password_required': 'Current password is required',
  'error_new_password_required': 'New password is required',
  'error_password_min_length': 'Password must be at least 8 characters',
  'error_password_same': 'New password must be different from current password',
  'error_password_weak':
      'Password must contain uppercase, lowercase, number, and special character',

  // Profile - General
  'logout_error': 'Logout failed. Please try again.',
  'logout_title': 'Are you sure you want to logout?',
  'logout_sub_Title':
      'You will need to enter your credentials to log back into your account.',

  // Update Profile Screen
  'update_profile': 'Update Profile',
  'first_name_required': 'First name is required',
  'first_name_min_length': 'First name must be at least 2 characters',
  'first_name_max_length': 'First name must not exceed 50 characters',
  'first_name_invalid': 'First name contains invalid characters',
  'last_name_required': 'Last name is required',
  'last_name_min_length': 'Last name must be at least 2 characters',
  'last_name_max_length': 'Last name must not exceed 50 characters',
  'last_name_invalid': 'Last name contains invalid characters',
  'username_already_changed_message':
      'Your username has already been changed. You can only change it once.',

  'total_received': 'Total Received',
  'receive_money': 'Receive Money',
  'no_transactions_yet': 'No transactions yet',
  'open_chat': 'Open Chat',
  'total_sent': 'Total Sent',
  'history_with': 'History with',
  'load_more': 'Load More',

  // Notifications
  'notifications': 'Notifications',
  'notifications_empty': 'No notifications yet',
  'notifications_empty_desc':
      'You\'ll see transaction updates, security alerts, and more here.',
  'mark_all_read': 'Mark all as read',
  'notification_prefs': 'Notification Settings',
  'notif_type_all': 'All',
  'notif_type_transaction': 'Transactions',
  'notif_type_security': 'Security',
  'notif_type_kyc': 'KYC',
  'notif_type_system': 'System',
  'notif_push_enabled': 'Push Notifications',
  'notif_push_enabled_desc': 'Receive push notifications on this device',
  'notif_transaction_enabled': 'Transaction Alerts',
  'notif_transaction_enabled_desc': 'Payments sent, received, and updates',
  'notif_security_enabled': 'Security Alerts',
  'notif_security_enabled_desc': 'Login alerts, password changes, 2FA events',
  'notif_kyc_enabled': 'KYC Updates',
  'notif_kyc_enabled_desc': 'Identity verification status updates',
  'notif_system_enabled': 'System Notifications',
  'notif_system_enabled_desc': 'Wallet freeze/unfreeze, account status',
  'notif_marketing_enabled': 'Promotions & Offers',
  'notif_marketing_enabled_desc': 'Promotional messages and announcements',
  'notif_mark_read': 'Mark as read',
  'notif_archive': 'Archive',
  'notif_delete': 'Delete',
  'notif_unread': 'Unread',
  'notif_all': 'All',
  'notif_permission_title': 'Stay Notified',
  'notif_permission_body':
      'Enable notifications to receive real-time alerts for transactions, security events, and account updates.',
  'notif_permission_enable': 'Enable',
  'notif_permission_not_now': 'Not Now',
  'notif_pref_save_error': 'Could not save preferences. Please try again.',
  'just_now': 'Just now',

  // Language names are not defined here: AppLanguage (app_localizations.dart)
  // carries each language's endonym on the enum itself, which is what the
  // language picker renders. The six keys that used to live here — including
  // German, French, Turkish and Russian, none of which this app supports —
  // were unreferenced.

  // Map picker (google_maps_flutter)
  'map_picker_title': 'Choose a location',
  'map_picker_hint':
      'Long-press anywhere on the map to place a pin, or use the button to locate yourself.',
  'map_picker_confirm': 'Confirm location',

  // ============================ Catalogue ============================
  'catalog_title': 'Catalogue',
  'catalog_search_hint': 'Search by name or code',
  'catalog_categories_section': 'Categories',
  'catalog_subcategories_section': 'Subcategories',
  'catalog_specs_section': 'Specifications',
  'catalog_category_product_count': '{count} products',
  'catalog_result_count': '{count} results',
  'catalog_available': 'Available',
  'catalog_unavailable': 'Unavailable',
  'catalog_datasheet': 'Datasheet',
  'catalog_datasheet_opening': 'Opening…',
  'catalog_datasheet_failed': 'Could not open the datasheet',
  'catalog_discontinued_notice':
      'This product has been discontinued and is shown for reference.',
  'catalog_browse_categories': 'Browse categories',
  'retry': 'Retry',

  // Filters
  'catalog_filters_title': 'Filters',
  'catalog_filters_reset': 'Reset',
  'catalog_filters_apply': 'Show results',
  'catalog_filters_clear_all': 'Clear all',
  'catalog_filters_search_values': 'Search values…',
  'catalog_filters_general': 'General',
  'catalog_filters_has_datasheet': 'Has a datasheet',
  'catalog_filters_available_only': 'Available only',
  'catalog_filters_unavailable_only': 'Unavailable only',
  'catalog_filters_show_more': 'Show more',
  'catalog_filters_show_less': 'Show less',
  'catalog_filter_dropped': 'A filter is no longer available and was removed.',
  // Sort
  'catalog_sort_relevance': 'Relevance',
  'catalog_sort_name': 'Name',
  'catalog_sort_newest': 'Newest',
  'catalog_sort_category': 'Category',

  // Empty & error states
  'catalog_empty_title': 'No categories yet',
  'catalog_empty_subtitle': 'The catalogue has not been set up yet.',
  'catalog_no_results_title': 'No products found',
  'catalog_no_results_subtitle': 'There is nothing in this category yet.',
  'catalog_no_results_filters':
      'No product matches the selected filters. Try removing one.',
  'catalog_unavailable_title': 'Catalogue not available yet',
  'catalog_unavailable_subtitle':
      'No catalogue version has been published yet. Please try again later.',
  'catalog_product_not_found_title': 'Product not available',
  'catalog_product_not_found_subtitle':
      'This product is not part of the published catalogue.',
  'catalog_search_intro_title': 'Search the catalogue',
  'catalog_search_intro_subtitle':
      'Search covers product names, codes and categories. To search by specification, use the filters.',
  'catalog_search_no_results_title': 'No results for “{term}”',
  'catalog_search_no_results_subtitle':
      'Search covers names, codes and categories only — not the specification sheet. Use the filters to search by specification.',
  // ========================== Notifications ==========================
  'notifications_title': 'Notifications',
  'notifications_filter_all': 'All',
  'notifications_type_security': 'Security',
  'notifications_type_system': 'System',
  'notifications_type_other': 'Other',
  'notifications_mark_all_read': 'Mark all read',
  // Deliberately carries no number: `read-all` returns a count that also
  // includes archived rows, so it can exceed what the user ever saw.
  'notifications_all_read': 'All marked as read',
  'notifications_archived': 'Notification deleted',
  'notifications_undo': 'Undo',
  'notifications_show_all': 'Show all',
  'notifications_empty_title': 'No notifications',
  'notifications_empty_subtitle':
      'Security alerts and account updates will arrive here.',
  'notifications_empty_filtered_title': 'Nothing in this category',
  'notifications_group_today': 'Today',
  'notifications_group_yesterday': 'Yesterday',
  'notifications_group_this_week': 'This week',
  'notifications_group_older': 'Earlier',
  'notifications_semantics_unread': 'Unread',
  'notifications_semantics_badge': '{count} unread notifications',

  // Notification bodies. Keyed on the derived sub-type rather than the
  // server's title: the title is a hard-coded English template that changes
  // whenever the backend edits a string, and matching on it breaks silently.
  // No name slots — the API sends raw uuids, never names.
  // Never rendered — a broadcast shows the server's own text verbatim.
  'notification_meta_logged_out_others':
      'You were signed out of your other devices',

  // Relative time. Arabic needs four grammatical buckets per unit; English
  // maps two of them onto the same string.
  'time_just_now': 'Just now',
  'time_minute_one': 'A minute ago',
  'time_minute_two': 'Two minutes ago',
  'time_minute_few': '{count} minutes ago',
  'time_minute_many': '{count} minutes ago',
  'time_hour_one': 'An hour ago',
  'time_hour_two': 'Two hours ago',
  'time_hour_few': '{count} hours ago',
  'time_hour_many': '{count} hours ago',
  'time_day_one': 'Yesterday',
  'time_day_two': 'Two days ago',
  'time_day_few': '{count} days ago',
  'time_day_many': '{count} days ago',
  // Registration — parties and neighbours
  'projects_register_parties': 'Parties',
  'stakeholder_slot_developer': 'Developer / owner',
  'stakeholder_slot_consultant': 'Consulting office',
  'stakeholder_slot_contractor': 'Main contractor',
  'projects_register_contractor_required':
      'Add the main contractor, including a contact name and phone number',
  'add_stakeholder_pick_hint': 'Search or add',
  'add_stakeholder_search_hint': 'Type at least 2 letters to search',
  'upload_too_large_short': 'Too big',
  'upload_rejected_short': 'Rejected',
  'add_stakeholder_search_failed':
      'Search failed — check your connection and try again.',
  'add_stakeholder_account_name': 'Company name',
  'add_stakeholder_account_name_hint': 'Full company name',
  'add_stakeholder_create_named': 'Add “{name}” as new',
  'add_stakeholder_contact_optional': 'Contact person (optional)',
  'add_stakeholder_contact_required': 'Contact person',
  'add_contact_phone_optional_hint': 'Phone (optional)',
  'projects_register_nearby_loading': 'Checking nearby buildings…',
  'projects_register_nearby_title': '{count} buildings already nearby',
  'projects_register_nearby_subtitle':
      'Check none of these is the same building before you register.',
  // Notification settings
  'notifications_type_marketing': 'Announcements',
  'notification_settings_title': 'Notification settings',
  'notification_settings_language': 'Notification language',
  'notification_settings_language_note':
      'Changes the language of all your notifications, including older ones.',
  'notification_settings_types': 'What you receive',
  'notification_settings_mute_note':
      'A muted category is never recorded — turning it back on does not bring back what you missed.',
  'notification_settings_push': 'Push',
  'notification_settings_push_enabled': 'Push notifications',
  'notification_settings_push_note':
      'Turning this off silences push only. Notifications still appear in your inbox.',
  'notifications_language_en': 'English',
  'notifications_language_ar': 'العربية',
  // ===================== Attainment (GET /attainment/me) =====================
  'ok': 'OK',
  'attainment_title': 'My Attainment',
  'attainment_period': 'Period',
  'attainment_metric': 'Metric',
  'attainment_period_note':
      'Whole periods only — a target is written for a quarter, a month or a year, so a figure over part of one would not mean anything.',
  'attainment_manager': 'Manager',
  'attainment_no_manager': 'No manager assigned',
  'attainment_as_of': 'As of',
  'attainment_target': 'Target',
  'attainment_attained': 'Achieved',
  // The pace benchmark — where the rep should stand today, not a
  // forecast of where they will finish.
  'attainment_expected_to_date': 'Expected by now',
  'attainment_remaining': 'Remaining',
  'attainment_status': 'Status',
  'attainment_overall': 'Overall attainment',
  'attainment_period_elapsed': '{percent} of the period elapsed',
  'attainment_days': 'days',
  'attainment_days_elapsed': 'Days elapsed',
  'attainment_period_finished':
      'This period is closed — this is the final result.',
  'attainment_targets': 'Targets',
  'attainment_sort': 'Sort',
  'attainment_target_id': 'Target ID:',
  'attainment_target_id_copied': 'Target ID copied',
  'attainment_confirmed_outcomes': 'Confirmed outcomes',
  'attainment_over_by': '{amount} over target',
  'attainment_overlap_note':
      'Targets shown overlap the selected period. A transfer may result in multiple rows.',
  'attainment_export_summary': 'Export summary',
  'attainment_export_copied': 'Summary copied to the clipboard',
  'attainment_empty_title': 'No target published for this period yet',
  'attainment_empty_subtitle':
      'Your manager publishes a target per period. Nothing has been published against this one.',
  'attainment_unavailable': 'Your attainment is unavailable right now',
  'attainment_forbidden_title': 'Not available for your role',
  'attainment_forbidden_subtitle':
      'This screen shows a representative’s own target. Managers see the same numbers on the team view.',
  'attainment_lifecycle_published': 'PUBLISHED',
  'attainment_lifecycle_closed': 'CLOSED',
  'attainment_status_met': 'MET',
  'attainment_status_on_track': 'ON TRACK',
  'attainment_status_at_risk': 'AT RISK',
  'attainment_status_behind': 'BEHIND',
  'attainment_status_unknown': 'UNKNOWN',
  'attainment_metric_sales_value': 'Sales value',
  'attainment_metric_units_supplied': 'Units supplied',
  'attainment_metric_wins_count': 'Wins count',
  'attainment_metric_sales_value_desc':
      'Value of confirmed sales in the period',
  'attainment_metric_units_supplied_desc':
      'Number of units supplied in the period',
  'attainment_metric_wins_count_desc': 'Number of confirmed wins in the period',
  'attainment_sort_period_asc': 'Period — earliest first',
  'attainment_sort_period_desc': 'Period — latest first',
  'attainment_sort_attainment_desc': 'Attainment — highest first',
  'attainment_sort_remaining_desc': 'Remaining — largest first',
  'attainment_home_pace': '{percent} of the period has gone',
  'attainment_help_title': 'How these numbers work',
  'attainment_help_pace':
      'A bare percentage is unreadable mid-period: 40% is excellent on day ten of a quarter and a crisis on day eighty. Read “Attained” against “Expected to date”, not against 100%.',
  'attainment_help_status':
      'Expected to date is the straight-line share of the target that should be done by now. MET means 100% or more. Otherwise: within 5 points of pace is ON TRACK, within 15 is AT RISK, further behind is BEHIND.',
  'attainment_help_split':
      'Two rows for one quarter means a transfer split it: you see the half your previous manager keeps and the half your new one owns. Together they add back to the whole quarter.',
  'attainment_help_closed':
      'A closed period has no pace left to miss, so it shows no expected figure and reads only MET or BEHIND.',
  'attainment_month_1': 'Jan',
  'attainment_month_2': 'Feb',
  'attainment_month_3': 'Mar',
  'attainment_month_4': 'Apr',
  'attainment_month_5': 'May',
  'attainment_month_6': 'Jun',
  'attainment_month_7': 'Jul',
  'attainment_month_8': 'Aug',
  'attainment_month_9': 'Sep',
  'attainment_month_10': 'Oct',
  'attainment_month_11': 'Nov',
  'attainment_month_12': 'Dec',
};
