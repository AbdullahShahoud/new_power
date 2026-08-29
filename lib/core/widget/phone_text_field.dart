import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_radius.dart';
import '../theming/styles.dart';
import 'glow_animation.dart';
import 'shake_animation.dart';

/// Phone entry with a country picker, shared app-wide.
///
/// Lived under `features/auth/ui/widgets/` while sign-up was its only
/// caller. It is now used by the directory and project screens too, and a
/// project screen reaching into the auth feature for a text field is the
/// kind of dependency that quietly turns features into one feature.
///
/// ⚠️ Read the value with [PhoneTextFieldState.fullPhoneNumber] through a
/// `GlobalKey<PhoneTextFieldState>`, **not** from the controller: the
/// controller holds only the local part, and the dial code lives in the
/// picker's own state. Sending `controller.text` posts a number with no
/// country on it.
class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  /// Fires on every keystroke with the **local** part, for callers whose
  /// own state depends on what has been typed — a sheet whose confirm
  /// button enables once a phone is present, for instance.
  ///
  /// The widget consumed `onChanged` internally before this existed (it
  /// clears the error state), so a caller had no way to observe typing at
  /// all and any button gated on the number stayed disabled forever.
  final ValueChanged<String>? onChanged;

  const PhoneTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.hintText = '7400 123456',
  });

  @override
  State<PhoneTextField> createState() => PhoneTextFieldState();
}

class PhoneTextFieldState extends State<PhoneTextField> {
  /// Saudi Arabia is the app's home market, so it's the sensible default
  /// rather than whatever happens to sit first in [_countries]. Falls back
  /// to the first entry if the `SA` row is ever removed from the list.
  _CountryItem _selected = _countries.firstWhere(
    (country) => country.code == 'SA',
    orElse: () => _countries.first,
  );
  bool _hasError = false;
  bool _isFocused = false;

  late FocusNode _focusNode;
  late GlobalKey<FormFieldState> _formFieldKey;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _formFieldKey = GlobalKey<FormFieldState>();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    // Phone numbers are always Western-digit/LTR content regardless of app
    // language — force LTR on the whole field (text flow + prefix icon
    // placement + hint alignment), not just the TextFormField's internal
    // text direction.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ShakeAnimation(
        shake: _hasError,
        child: GlowAnimation(
          isActive: _isFocused && !_hasError,
          glowColor: context.colors.brand100,
          continuous: true,
          child: TextFormField(
            key: _formFieldKey,
            focusNode: _focusNode,
            controller: widget.controller,
            validator: (value) {
              final error = widget.validator?.call(value);
              if (mounted) {
                setState(() => _hasError = error != null);
                if (_hasError) {
                  HapticFeedback.heavyImpact();
                }
              }
              return error;
            },
            onChanged: (value) {
              if (_hasError) {
                setState(() => _hasError = false);
              }
              widget.onChanged?.call(value);
            },
            keyboardType: TextInputType.phone,
            style: context.textStyles.smRegular,
            textDirection: TextDirection.ltr,
            autofillHints: const [AutofillHints.telephoneNumber],
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
            ],
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: context.textStyles.smRegular.copyWith(
                color: context.colors.ink400,
              ),
              filled: true,
              fillColor: context.colors.surface,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              prefixIcon: GestureDetector(
                onTap: () => _showCountryPicker(context),
                child: _CountryCodePrefix(
                  flag: _selected.flag,
                  code: _selected.dialCode,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.field),
                borderSide: BorderSide(color: context.colors.ink200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.field),
                borderSide: BorderSide(color: context.colors.ink200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.field),
                borderSide: BorderSide(
                  color: context.colors.brand300,
                  width: 2.w,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.field),
                borderSide: BorderSide(color: context.colors.error, width: 2.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.field),
                borderSide: BorderSide(color: context.colors.error, width: 2.w),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get fullPhoneNumber =>
      '${_selected.dialCode}${widget.controller.text}';

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: context.colors.Color10,
      builder: (sheetContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (_, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: sheetContext.colors.Color10,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: _CountryPickerSheet(
                  selected: _selected,
                  scrollController: scrollController,
                  onSelected: (country) {
                    setState(() => _selected = country);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ─── Country code prefix shown inside the text field ───

class _CountryCodePrefix extends StatelessWidget {
  final String flag;
  final String code;

  const _CountryCodePrefix({required this.flag, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 12.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(flag, style: TextStyle(fontSize: 18.sp)),
          horizontalSpace(4.w),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.colors.Color70,
            size: 16.sp,
          ),
          horizontalSpace(4.w),
          Text(
            code,
            style: context.textStyles.smRegular.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          horizontalSpace(8.w),
          Container(width: 1, height: 20.h, color: context.colors.Color70),
          horizontalSpace(8.w),
        ],
      ),
    );
  }
}

// ─── Country picker bottom sheet ───

class _CountryPickerSheet extends StatefulWidget {
  final _CountryItem selected;
  final ValueChanged<_CountryItem> onSelected;
  final ScrollController scrollController;

  const _CountryPickerSheet({
    required this.selected,
    required this.onSelected,
    required this.scrollController,
  });

  @override
  State<_CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<_CountryPickerSheet> {
  final _searchController = TextEditingController();
  List<_CountryItem> _filtered = _countries;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = _countries
          .where(
            (c) =>
                c.name.toLowerCase().contains(query) ||
                c.dialCode.contains(query),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: TextField(
            controller: _searchController,
            style: context.textStyles.smRegular,
            decoration: InputDecoration(
              hintText: 'Search country...',
              hintStyle: context.textStyles.smRegular.copyWith(
                color: context.colors.Color70,
              ),
              filled: true,
              fillColor: context.colors.Color13,
              prefixIcon: Icon(
                Icons.search,
                color: context.colors.Color70,
                size: 20.sp,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.full),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ),
        ..._filtered.map((country) {
          final isSelected = country.code == widget.selected.code;
          return ListTile(
            leading: Text(country.flag, style: TextStyle(fontSize: 24.sp)),
            title: Text(country.name, style: context.textStyles.smRegular),
            trailing: Text(
              country.dialCode,
              style: context.textStyles.smRegular.copyWith(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.whiteColor70,
              ),
            ),
            selected: isSelected,
            onTap: () => widget.onSelected(country),
          );
        }),
        SizedBox(height: 20.h),
      ],
    );
  }
}

// ─── Country data model & list ───

class _CountryItem {
  final String flag;
  final String name;
  final String dialCode;
  final String code;

  const _CountryItem(this.flag, this.name, this.dialCode, this.code);
}

const _countries = [
  _CountryItem('🇬🇧', 'United Kingdom', '+44', 'GB'),
  _CountryItem('🇺🇸', 'United States', '+1', 'US'),
  _CountryItem('🇪🇬', 'Egypt', '+20', 'EG'),
  _CountryItem('🇸🇦', 'Saudi Arabia', '+966', 'SA'),
  _CountryItem('🇦🇪', 'United Arab Emirates', '+971', 'AE'),
  _CountryItem('🇰🇼', 'Kuwait', '+965', 'KW'),
  _CountryItem('🇶🇦', 'Qatar', '+974', 'QA'),
  _CountryItem('🇧🇭', 'Bahrain', '+973', 'BH'),
  _CountryItem('🇴🇲', 'Oman', '+968', 'OM'),
  _CountryItem('🇯🇴', 'Jordan', '+962', 'JO'),
  _CountryItem('🇱🇧', 'Lebanon', '+961', 'LB'),
  _CountryItem('🇮🇶', 'Iraq', '+964', 'IQ'),
  _CountryItem('🇩🇿', 'Algeria', '+213', 'DZ'),
  _CountryItem('🇲🇦', 'Morocco', '+212', 'MA'),
  _CountryItem('🇹🇳', 'Tunisia', '+216', 'TN'),
  _CountryItem('🇱🇾', 'Libya', '+218', 'LY'),
  _CountryItem('🇸🇩', 'Sudan', '+249', 'SD'),
  _CountryItem('🇵🇰', 'Pakistan', '+92', 'PK'),
  _CountryItem('🇮🇳', 'India', '+91', 'IN'),
  _CountryItem('🇹🇷', 'Turkey', '+90', 'TR'),
  _CountryItem('🇩🇪', 'Germany', '+49', 'DE'),
  _CountryItem('🇫🇷', 'France', '+33', 'FR'),
  _CountryItem('🇮🇹', 'Italy', '+39', 'IT'),
  _CountryItem('🇪🇸', 'Spain', '+34', 'ES'),
  _CountryItem('🇨🇦', 'Canada', '+1', 'CA'),
  _CountryItem('🇦🇺', 'Australia', '+61', 'AU'),
  _CountryItem('🇸🇾', 'Syria', '+963', 'SY'),
  // Additional countries from other continents
  _CountryItem('🇧🇷', 'Brazil', '+55', 'BR'),
  _CountryItem('🇲🇽', 'Mexico', '+52', 'MX'),
  _CountryItem('🇦🇷', 'Argentina', '+54', 'AR'),
  _CountryItem('🇨🇴', 'Colombia', '+57', 'CO'),
  _CountryItem('🇵🇪', 'Peru', '+51', 'PE'),
  _CountryItem('🇻🇪', 'Venezuela', '+58', 'VE'),
  _CountryItem('🇨🇱', 'Chile', '+56', 'CL'),
  _CountryItem('🇪🇨', 'Ecuador', '+593', 'EC'),
  _CountryItem('🇺🇾', 'Uruguay', '+598', 'UY'),
  _CountryItem('🇵🇾', 'Paraguay', '+595', 'PY'),
  _CountryItem('🇧🇴', 'Bolivia', '+591', 'BO'),
  _CountryItem('🇨🇷', 'Costa Rica', '+506', 'CR'),
  _CountryItem('🇵🇦', 'Panama', '+507', 'PA'),
  _CountryItem('🇸🇻', 'El Salvador', '+503', 'SV'),
  _CountryItem('🇬🇹', 'Guatemala', '+502', 'GT'),
  _CountryItem('🇭🇳', 'Honduras', '+504', 'HN'),
  _CountryItem('🇳🇮', 'Nicaragua', '+505', 'NI'),
  _CountryItem('🇩🇴', 'Dominican Republic', '+1', 'DO'),
  _CountryItem('🇯🇲', 'Jamaica', '+1', 'JM'),
  _CountryItem('🇭🇹', 'Haiti', '+509', 'HT'),
  _CountryItem('🇨🇺', 'Cuba', '+53', 'CU'),
  _CountryItem('🇵🇷', 'Puerto Rico', '+1', 'PR'),
  _CountryItem('🇹🇹', 'Trinidad and Tobago', '+1', 'TT'),
  _CountryItem('🇧🇧', 'Barbados', '+1', 'BB'),
  _CountryItem('🇧🇸', 'Bahamas', '+1', 'BS'),
  _CountryItem('🇻🇬', 'British Virgin Islands', '+1', 'VG'),
  _CountryItem('🇰🇾', 'Cayman Islands', '+1', 'KY'),
  _CountryItem('🇧🇲', 'Bermuda', '+1', 'BM'),
  _CountryItem('🇦🇬', 'Antigua and Barbuda', '+1', 'AG'),
  _CountryItem('🇻🇨', 'Saint Vincent and the Grenadines', '+1', 'VC'),
  _CountryItem('🇬🇩', 'Grenada', '+1', 'GD'),
  _CountryItem('🇰🇳', 'Saint Kitts and Nevis', '+1', 'KN'),
  _CountryItem('🇱🇨', 'Saint Lucia', '+1', 'LC'),
  _CountryItem('🇩🇲', 'Dominica', '+1', 'DM'),
  _CountryItem('🇲🇸', 'Montserrat', '+1', 'MS'),
  _CountryItem('🇹🇨', 'Turks and Caicos Islands', '+1', 'TC'),
  _CountryItem('🇦🇮', 'Anguilla', '+1', 'AI'),
  _CountryItem('🇸🇽', 'Sint Maarten', '+1', 'SX'),
  _CountryItem('🇧🇱', 'Saint Barthélemy', '+590', 'BL'),
  _CountryItem('🇬🇵', 'Guadeloupe', '+590', 'GP'),
  _CountryItem('🇲🇶', 'Martinique', '+596', 'MQ'),
  _CountryItem('🇬🇫', 'French Guiana', '+594', 'GF'),
  _CountryItem('🇵🇫', 'French Polynesia', '+689', 'PF'),
  _CountryItem('🇳🇨', 'New Caledonia', '+687', 'NC'),
  _CountryItem('🇼🇫', 'Wallis and Futuna', '+681', 'WF'),
  _CountryItem('🇨🇰', 'Cook Islands', '+682', 'CK'),
  _CountryItem('🇳🇺', 'Niue', '+683', 'NU'),
  _CountryItem('🇹🇰', 'Tokelau', '+690', 'TK'),
  _CountryItem('🇦🇸', 'American Samoa', '+1', 'AS'),
  _CountryItem('🇬🇺', 'Guam', '+1', 'GU'),
  _CountryItem('🇲🇵', 'Northern Mariana Islands', '+1', 'MP'),
  _CountryItem('🇺🇲', 'U.S. Minor Outlying Islands', '+1', 'UM'),
  _CountryItem('🇻🇮', 'U.S. Virgin Islands', '+1', 'VI'),
  _CountryItem('🇨🇳', 'China', '+86', 'CN'),
  _CountryItem('🇯🇵', 'Japan', '+81', 'JP'),
  _CountryItem('🇰🇷', 'South Korea', '+82', 'KR'),
  _CountryItem('🇹🇼', 'Taiwan', '+886', 'TW'),
  _CountryItem('🇭🇰', 'Hong Kong', '+852', 'HK'),
  _CountryItem('🇲🇴', 'Macau', '+853', 'MO'),
  _CountryItem('🇸🇬', 'Singapore', '+65', 'SG'),
  _CountryItem('🇲🇾', 'Malaysia', '+60', 'MY'),
  _CountryItem('🇹🇭', 'Thailand', '+66', 'TH'),
  _CountryItem('🇮🇩', 'Indonesia', '+62', 'ID'),
  _CountryItem('🇵🇭', 'Philippines', '+63', 'PH'),
  _CountryItem('🇻🇳', 'Vietnam', '+84', 'VN'),
  _CountryItem('🇰🇭', 'Cambodia', '+855', 'KH'),
  _CountryItem('🇱🇦', 'Laos', '+856', 'LA'),
  _CountryItem('🇲🇲', 'Myanmar', '+95', 'MM'),
  _CountryItem('🇧🇩', 'Bangladesh', '+880', 'BD'),
  _CountryItem('🇱🇰', 'Sri Lanka', '+94', 'LK'),
  _CountryItem('🇳🇵', 'Nepal', '+977', 'NP'),
  _CountryItem('🇧🇹', 'Bhutan', '+975', 'BT'),
  _CountryItem('🇲🇻', 'Maldives', '+960', 'MV'),
  _CountryItem('🇦🇫', 'Afghanistan', '+93', 'AF'),
  _CountryItem('🇮🇷', 'Iran', '+98', 'IR'),
  _CountryItem('🇾🇪', 'Yemen', '+967', 'YE'),
  _CountryItem('🇵🇸', 'Palestine', '+970', 'PS'),
  _CountryItem('🇮🇱', 'Israel', '+972', 'IL'),
  _CountryItem('🇨🇾', 'Cyprus', '+357', 'CY'),
  _CountryItem('🇬🇷', 'Greece', '+30', 'GR'),
  _CountryItem('🇵🇹', 'Portugal', '+351', 'PT'),
  _CountryItem('🇳🇱', 'Netherlands', '+31', 'NL'),
  _CountryItem('🇧🇪', 'Belgium', '+32', 'BE'),
  _CountryItem('🇱🇺', 'Luxembourg', '+352', 'LU'),
  _CountryItem('🇦🇹', 'Austria', '+43', 'AT'),
  _CountryItem('🇨🇭', 'Switzerland', '+41', 'CH'),
  _CountryItem('🇸🇪', 'Sweden', '+46', 'SE'),
  _CountryItem('🇳🇴', 'Norway', '+47', 'NO'),
  _CountryItem('🇩🇰', 'Denmark', '+45', 'DK'),
  _CountryItem('🇫🇮', 'Finland', '+358', 'FI'),
  _CountryItem('🇮🇸', 'Iceland', '+354', 'IS'),
  _CountryItem('🇮🇪', 'Ireland', '+353', 'IE'),
  _CountryItem('🇵🇱', 'Poland', '+48', 'PL'),
  _CountryItem('🇨🇿', 'Czech Republic', '+420', 'CZ'),
  _CountryItem('🇸🇰', 'Slovakia', '+421', 'SK'),
  _CountryItem('🇭🇺', 'Hungary', '+36', 'HU'),
  _CountryItem('🇷🇴', 'Romania', '+40', 'RO'),
  _CountryItem('🇧🇬', 'Bulgaria', '+359', 'BG'),
  _CountryItem('🇷🇸', 'Serbia', '+381', 'RS'),
  _CountryItem('🇭🇷', 'Croatia', '+385', 'HR'),
  _CountryItem('🇸🇮', 'Slovenia', '+386', 'SI'),
  _CountryItem('🇧🇦', 'Bosnia and Herzegovina', '+387', 'BA'),
  _CountryItem('🇲🇪', 'Montenegro', '+382', 'ME'),
  _CountryItem('🇦🇱', 'Albania', '+355', 'AL'),
  _CountryItem('🇲🇰', 'North Macedonia', '+389', 'MK'),
  _CountryItem('🇽🇰', 'Kosovo', '+383', 'XK'),
  _CountryItem('🇲🇩', 'Moldova', '+373', 'MD'),
  _CountryItem('🇺🇦', 'Ukraine', '+380', 'UA'),
  _CountryItem('🇧🇾', 'Belarus', '+375', 'BY'),
  _CountryItem('🇱🇹', 'Lithuania', '+370', 'LT'),
  _CountryItem('🇱🇻', 'Latvia', '+371', 'LV'),
  _CountryItem('🇪🇪', 'Estonia', '+372', 'EE'),
  _CountryItem('🇷🇺', 'Russia', '+7', 'RU'),
  _CountryItem('🇰🇿', 'Kazakhstan', '+7', 'KZ'),
  _CountryItem('🇺🇿', 'Uzbekistan', '+998', 'UZ'),
  _CountryItem('🇹🇲', 'Turkmenistan', '+993', 'TM'),
  _CountryItem('🇹🇯', 'Tajikistan', '+992', 'TJ'),
  _CountryItem('🇰🇬', 'Kyrgyzstan', '+996', 'KG'),
  _CountryItem('🇲🇳', 'Mongolia', '+976', 'MN'),
  _CountryItem('🇰🇵', 'North Korea', '+850', 'KP'),
  _CountryItem('🇳', 'Brunei', '+673', 'BN'),
  _CountryItem('🇹🇱', 'Timor-Leste', '+670', 'TL'),
  _CountryItem('🇵🇬', 'Papua New Guinea', '+675', 'PG'),
  _CountryItem('🇫🇯', 'Fiji', '+679', 'FJ'),
  _CountryItem('🇻🇺', 'Vanuatu', '+678', 'VU'),
  _CountryItem('🇸🇧', 'Solomon Islands', '+677', 'SB'),
  _CountryItem('🇳🇷', 'Nauru', '+674', 'NR'),
  _CountryItem('🇰🇮', 'Kiribati', '+686', 'KI'),
  _CountryItem('🇹🇻', 'Tuvalu', '+688', 'TV'),
  _CountryItem('🇼🇸', 'Samoa', '+685', 'WS'),
  _CountryItem('🇹🇴', 'Tonga', '+676', 'TO'),
  _CountryItem('🇵🇼', 'Palau', '+680', 'PW'),
  _CountryItem('🇫🇲', 'Micronesia', '+691', 'FM'),
  _CountryItem('🇲🇭', 'Marshall Islands', '+692', 'MH'),
  _CountryItem('🇿🇦', 'South Africa', '+27', 'ZA'),
  _CountryItem('🇳🇬', 'Nigeria', '+234', 'NG'),
  _CountryItem('🇰🇪', 'Kenya', '+254', 'KE'),
  _CountryItem('🇬🇭', 'Ghana', '+233', 'GH'),
  _CountryItem('🇺🇬', 'Uganda', '+256', 'UG'),
  _CountryItem('🇹🇿', 'Tanzania', '+255', 'TZ'),
  _CountryItem('🇷🇼', 'Rwanda', '+250', 'RW'),
  _CountryItem('🇧🇮', 'Burundi', '+257', 'BI'),
  _CountryItem('🇨🇩', 'Democratic Republic of the Congo', '+243', 'CD'),
  _CountryItem('🇨🇬', 'Republic of the Congo', '+242', 'CG'),
  _CountryItem('🇬🇦', 'Gabon', '+241', 'GA'),
  _CountryItem('🇨🇲', 'Cameroon', '+237', 'CM'),
  _CountryItem('🇹🇩', 'Chad', '+235', 'TD'),
  _CountryItem('🇨🇫', 'Central African Republic', '+236', 'CF'),
  _CountryItem('🇬🇶', 'Equatorial Guinea', '+240', 'GQ'),
  _CountryItem('🇸🇹', 'São Tomé and Príncipe', '+239', 'ST'),
  _CountryItem('🇬🇼', 'Guinea-Bissau', '+245', 'GW'),
  _CountryItem('🇬🇳', 'Guinea', '+224', 'GN'),
  _CountryItem('🇸🇱', 'Sierra Leone', '+232', 'SL'),
  _CountryItem('🇱🇷', 'Liberia', '+231', 'LR'),
  _CountryItem('🇨🇮', 'Ivory Coast', '+225', 'CI'),
  _CountryItem('🇧🇫', 'Burkina Faso', '+226', 'BF'),
  _CountryItem('🇹🇬', 'Togo', '+228', 'TG'),
  _CountryItem('🇧🇯', 'Benin', '+229', 'BJ'),
  _CountryItem('🇳🇪', 'Niger', '+227', 'NE'),
  _CountryItem('🇲🇱', 'Mali', '+223', 'ML'),
  _CountryItem('🇸🇳', 'Senegal', '+221', 'SN'),
  _CountryItem('🇬🇲', 'Gambia', '+220', 'GM'),
  _CountryItem('🇨🇻', 'Cape Verde', '+238', 'CV'),
  _CountryItem('🇲🇷', 'Mauritania', '+222', 'MR'),
  _CountryItem('🇪🇭', 'Western Sahara', '+212', 'EH'),
  _CountryItem('🇿🇲', 'Zambia', '+260', 'ZM'),
  _CountryItem('🇿🇼', 'Zimbabwe', '+263', 'ZW'),
  _CountryItem('🇲🇿', 'Mozambique', '+258', 'MZ'),
  _CountryItem('🇲🇬', 'Madagascar', '+261', 'MG'),
  _CountryItem('🇸🇨', 'Seychelles', '+248', 'SC'),
  _CountryItem('🇰🇲', 'Comoros', '+269', 'KM'),
  _CountryItem('🇲🇺', 'Mauritius', '+230', 'MU'),
  _CountryItem('🇷🇪', 'Réunion', '+262', 'RE'),
  _CountryItem('🇾🇹', 'Mayotte', '+262', 'YT'),
  _CountryItem('🇦🇴', 'Angola', '+244', 'AO'),
  _CountryItem('🇳🇦', 'Namibia', '+264', 'NA'),
  _CountryItem('🇧🇼', 'Botswana', '+267', 'BW'),
  _CountryItem('🇸🇿', 'Eswatini', '+268', 'SZ'),
  _CountryItem('🇱🇸', 'Lesotho', '+266', 'LS'),
  _CountryItem('🇲🇼', 'Malawi', '+265', 'MW'),
];
