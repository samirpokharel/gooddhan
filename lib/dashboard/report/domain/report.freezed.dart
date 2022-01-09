// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
class _$ReportTearOff {
  const _$ReportTearOff();

  _Report call(
      {required ReportElement report,
      List<CategoryReport> categoryReport = const [],
      List<ExpenseReportOnTimePeroid> expenseReportOnTimePeroid = const []}) {
    return _Report(
      report: report,
      categoryReport: categoryReport,
      expenseReportOnTimePeroid: expenseReportOnTimePeroid,
    );
  }

  Report fromJson(Map<String, Object?> json) {
    return Report.fromJson(json);
  }
}

/// @nodoc
const $Report = _$ReportTearOff();

/// @nodoc
mixin _$Report {
  ReportElement get report => throw _privateConstructorUsedError;
  List<CategoryReport> get categoryReport => throw _privateConstructorUsedError;
  List<ExpenseReportOnTimePeroid> get expenseReportOnTimePeroid =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
  $Res call(
      {ReportElement report,
      List<CategoryReport> categoryReport,
      List<ExpenseReportOnTimePeroid> expenseReportOnTimePeroid});

  $ReportElementCopyWith<$Res> get report;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object? report = freezed,
    Object? categoryReport = freezed,
    Object? expenseReportOnTimePeroid = freezed,
  }) {
    return _then(_value.copyWith(
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as ReportElement,
      categoryReport: categoryReport == freezed
          ? _value.categoryReport
          : categoryReport // ignore: cast_nullable_to_non_nullable
              as List<CategoryReport>,
      expenseReportOnTimePeroid: expenseReportOnTimePeroid == freezed
          ? _value.expenseReportOnTimePeroid
          : expenseReportOnTimePeroid // ignore: cast_nullable_to_non_nullable
              as List<ExpenseReportOnTimePeroid>,
    ));
  }

  @override
  $ReportElementCopyWith<$Res> get report {
    return $ReportElementCopyWith<$Res>(_value.report, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc
abstract class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) then) =
      __$ReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {ReportElement report,
      List<CategoryReport> categoryReport,
      List<ExpenseReportOnTimePeroid> expenseReportOnTimePeroid});

  @override
  $ReportElementCopyWith<$Res> get report;
}

/// @nodoc
class __$ReportCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(_Report _value, $Res Function(_Report) _then)
      : super(_value, (v) => _then(v as _Report));

  @override
  _Report get _value => super._value as _Report;

  @override
  $Res call({
    Object? report = freezed,
    Object? categoryReport = freezed,
    Object? expenseReportOnTimePeroid = freezed,
  }) {
    return _then(_Report(
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as ReportElement,
      categoryReport: categoryReport == freezed
          ? _value.categoryReport
          : categoryReport // ignore: cast_nullable_to_non_nullable
              as List<CategoryReport>,
      expenseReportOnTimePeroid: expenseReportOnTimePeroid == freezed
          ? _value.expenseReportOnTimePeroid
          : expenseReportOnTimePeroid // ignore: cast_nullable_to_non_nullable
              as List<ExpenseReportOnTimePeroid>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report implements _Report {
  const _$_Report(
      {required this.report,
      this.categoryReport = const [],
      this.expenseReportOnTimePeroid = const []});

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  final ReportElement report;
  @JsonKey()
  @override
  final List<CategoryReport> categoryReport;
  @JsonKey()
  @override
  final List<ExpenseReportOnTimePeroid> expenseReportOnTimePeroid;

  @override
  String toString() {
    return 'Report(report: $report, categoryReport: $categoryReport, expenseReportOnTimePeroid: $expenseReportOnTimePeroid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Report &&
            const DeepCollectionEquality().equals(other.report, report) &&
            const DeepCollectionEquality()
                .equals(other.categoryReport, categoryReport) &&
            const DeepCollectionEquality().equals(
                other.expenseReportOnTimePeroid, expenseReportOnTimePeroid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(report),
      const DeepCollectionEquality().hash(categoryReport),
      const DeepCollectionEquality().hash(expenseReportOnTimePeroid));

  @JsonKey(ignore: true)
  @override
  _$ReportCopyWith<_Report> get copyWith =>
      __$ReportCopyWithImpl<_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(this);
  }
}

abstract class _Report implements Report {
  const factory _Report(
      {required ReportElement report,
      List<CategoryReport> categoryReport,
      List<ExpenseReportOnTimePeroid> expenseReportOnTimePeroid}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  ReportElement get report;
  @override
  List<CategoryReport> get categoryReport;
  @override
  List<ExpenseReportOnTimePeroid> get expenseReportOnTimePeroid;
  @override
  @JsonKey(ignore: true)
  _$ReportCopyWith<_Report> get copyWith => throw _privateConstructorUsedError;
}

CategoryReport _$CategoryReportFromJson(Map<String, dynamic> json) {
  return _CategoryReport.fromJson(json);
}

/// @nodoc
class _$CategoryReportTearOff {
  const _$CategoryReportTearOff();

  _CategoryReport call(
      {@JsonKey(name: "_id") required String id,
      required num totalExpenseAmount,
      required num avgExpenseAmount,
      required String categoryname}) {
    return _CategoryReport(
      id: id,
      totalExpenseAmount: totalExpenseAmount,
      avgExpenseAmount: avgExpenseAmount,
      categoryname: categoryname,
    );
  }

  CategoryReport fromJson(Map<String, Object?> json) {
    return CategoryReport.fromJson(json);
  }
}

/// @nodoc
const $CategoryReport = _$CategoryReportTearOff();

/// @nodoc
mixin _$CategoryReport {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  num get totalExpenseAmount => throw _privateConstructorUsedError;
  num get avgExpenseAmount => throw _privateConstructorUsedError;
  String get categoryname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryReportCopyWith<CategoryReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryReportCopyWith<$Res> {
  factory $CategoryReportCopyWith(
          CategoryReport value, $Res Function(CategoryReport) then) =
      _$CategoryReportCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "_id") String id,
      num totalExpenseAmount,
      num avgExpenseAmount,
      String categoryname});
}

/// @nodoc
class _$CategoryReportCopyWithImpl<$Res>
    implements $CategoryReportCopyWith<$Res> {
  _$CategoryReportCopyWithImpl(this._value, this._then);

  final CategoryReport _value;
  // ignore: unused_field
  final $Res Function(CategoryReport) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? totalExpenseAmount = freezed,
    Object? avgExpenseAmount = freezed,
    Object? categoryname = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalExpenseAmount: totalExpenseAmount == freezed
          ? _value.totalExpenseAmount
          : totalExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      avgExpenseAmount: avgExpenseAmount == freezed
          ? _value.avgExpenseAmount
          : avgExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      categoryname: categoryname == freezed
          ? _value.categoryname
          : categoryname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CategoryReportCopyWith<$Res>
    implements $CategoryReportCopyWith<$Res> {
  factory _$CategoryReportCopyWith(
          _CategoryReport value, $Res Function(_CategoryReport) then) =
      __$CategoryReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "_id") String id,
      num totalExpenseAmount,
      num avgExpenseAmount,
      String categoryname});
}

/// @nodoc
class __$CategoryReportCopyWithImpl<$Res>
    extends _$CategoryReportCopyWithImpl<$Res>
    implements _$CategoryReportCopyWith<$Res> {
  __$CategoryReportCopyWithImpl(
      _CategoryReport _value, $Res Function(_CategoryReport) _then)
      : super(_value, (v) => _then(v as _CategoryReport));

  @override
  _CategoryReport get _value => super._value as _CategoryReport;

  @override
  $Res call({
    Object? id = freezed,
    Object? totalExpenseAmount = freezed,
    Object? avgExpenseAmount = freezed,
    Object? categoryname = freezed,
  }) {
    return _then(_CategoryReport(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalExpenseAmount: totalExpenseAmount == freezed
          ? _value.totalExpenseAmount
          : totalExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      avgExpenseAmount: avgExpenseAmount == freezed
          ? _value.avgExpenseAmount
          : avgExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      categoryname: categoryname == freezed
          ? _value.categoryname
          : categoryname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryReport implements _CategoryReport {
  const _$_CategoryReport(
      {@JsonKey(name: "_id") required this.id,
      required this.totalExpenseAmount,
      required this.avgExpenseAmount,
      required this.categoryname});

  factory _$_CategoryReport.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryReportFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final num totalExpenseAmount;
  @override
  final num avgExpenseAmount;
  @override
  final String categoryname;

  @override
  String toString() {
    return 'CategoryReport(id: $id, totalExpenseAmount: $totalExpenseAmount, avgExpenseAmount: $avgExpenseAmount, categoryname: $categoryname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryReport &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.totalExpenseAmount, totalExpenseAmount) &&
            const DeepCollectionEquality()
                .equals(other.avgExpenseAmount, avgExpenseAmount) &&
            const DeepCollectionEquality()
                .equals(other.categoryname, categoryname));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(totalExpenseAmount),
      const DeepCollectionEquality().hash(avgExpenseAmount),
      const DeepCollectionEquality().hash(categoryname));

  @JsonKey(ignore: true)
  @override
  _$CategoryReportCopyWith<_CategoryReport> get copyWith =>
      __$CategoryReportCopyWithImpl<_CategoryReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryReportToJson(this);
  }
}

abstract class _CategoryReport implements CategoryReport {
  const factory _CategoryReport(
      {@JsonKey(name: "_id") required String id,
      required num totalExpenseAmount,
      required num avgExpenseAmount,
      required String categoryname}) = _$_CategoryReport;

  factory _CategoryReport.fromJson(Map<String, dynamic> json) =
      _$_CategoryReport.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  num get totalExpenseAmount;
  @override
  num get avgExpenseAmount;
  @override
  String get categoryname;
  @override
  @JsonKey(ignore: true)
  _$CategoryReportCopyWith<_CategoryReport> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseReportOnTimePeroid _$ExpenseReportOnTimePeroidFromJson(
    Map<String, dynamic> json) {
  return _ExpenseReportOnTimePeroid.fromJson(json);
}

/// @nodoc
class _$ExpenseReportOnTimePeroidTearOff {
  const _$ExpenseReportOnTimePeroidTearOff();

  _ExpenseReportOnTimePeroid call(
      {required num totalExpenseAmount,
      required num averageExpenseAmount,
      required DateTime date}) {
    return _ExpenseReportOnTimePeroid(
      totalExpenseAmount: totalExpenseAmount,
      averageExpenseAmount: averageExpenseAmount,
      date: date,
    );
  }

  ExpenseReportOnTimePeroid fromJson(Map<String, Object?> json) {
    return ExpenseReportOnTimePeroid.fromJson(json);
  }
}

/// @nodoc
const $ExpenseReportOnTimePeroid = _$ExpenseReportOnTimePeroidTearOff();

/// @nodoc
mixin _$ExpenseReportOnTimePeroid {
  num get totalExpenseAmount => throw _privateConstructorUsedError;
  num get averageExpenseAmount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseReportOnTimePeroidCopyWith<ExpenseReportOnTimePeroid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseReportOnTimePeroidCopyWith<$Res> {
  factory $ExpenseReportOnTimePeroidCopyWith(ExpenseReportOnTimePeroid value,
          $Res Function(ExpenseReportOnTimePeroid) then) =
      _$ExpenseReportOnTimePeroidCopyWithImpl<$Res>;
  $Res call({num totalExpenseAmount, num averageExpenseAmount, DateTime date});
}

/// @nodoc
class _$ExpenseReportOnTimePeroidCopyWithImpl<$Res>
    implements $ExpenseReportOnTimePeroidCopyWith<$Res> {
  _$ExpenseReportOnTimePeroidCopyWithImpl(this._value, this._then);

  final ExpenseReportOnTimePeroid _value;
  // ignore: unused_field
  final $Res Function(ExpenseReportOnTimePeroid) _then;

  @override
  $Res call({
    Object? totalExpenseAmount = freezed,
    Object? averageExpenseAmount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      totalExpenseAmount: totalExpenseAmount == freezed
          ? _value.totalExpenseAmount
          : totalExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      averageExpenseAmount: averageExpenseAmount == freezed
          ? _value.averageExpenseAmount
          : averageExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ExpenseReportOnTimePeroidCopyWith<$Res>
    implements $ExpenseReportOnTimePeroidCopyWith<$Res> {
  factory _$ExpenseReportOnTimePeroidCopyWith(_ExpenseReportOnTimePeroid value,
          $Res Function(_ExpenseReportOnTimePeroid) then) =
      __$ExpenseReportOnTimePeroidCopyWithImpl<$Res>;
  @override
  $Res call({num totalExpenseAmount, num averageExpenseAmount, DateTime date});
}

/// @nodoc
class __$ExpenseReportOnTimePeroidCopyWithImpl<$Res>
    extends _$ExpenseReportOnTimePeroidCopyWithImpl<$Res>
    implements _$ExpenseReportOnTimePeroidCopyWith<$Res> {
  __$ExpenseReportOnTimePeroidCopyWithImpl(_ExpenseReportOnTimePeroid _value,
      $Res Function(_ExpenseReportOnTimePeroid) _then)
      : super(_value, (v) => _then(v as _ExpenseReportOnTimePeroid));

  @override
  _ExpenseReportOnTimePeroid get _value =>
      super._value as _ExpenseReportOnTimePeroid;

  @override
  $Res call({
    Object? totalExpenseAmount = freezed,
    Object? averageExpenseAmount = freezed,
    Object? date = freezed,
  }) {
    return _then(_ExpenseReportOnTimePeroid(
      totalExpenseAmount: totalExpenseAmount == freezed
          ? _value.totalExpenseAmount
          : totalExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      averageExpenseAmount: averageExpenseAmount == freezed
          ? _value.averageExpenseAmount
          : averageExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseReportOnTimePeroid implements _ExpenseReportOnTimePeroid {
  const _$_ExpenseReportOnTimePeroid(
      {required this.totalExpenseAmount,
      required this.averageExpenseAmount,
      required this.date});

  factory _$_ExpenseReportOnTimePeroid.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseReportOnTimePeroidFromJson(json);

  @override
  final num totalExpenseAmount;
  @override
  final num averageExpenseAmount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ExpenseReportOnTimePeroid(totalExpenseAmount: $totalExpenseAmount, averageExpenseAmount: $averageExpenseAmount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseReportOnTimePeroid &&
            const DeepCollectionEquality()
                .equals(other.totalExpenseAmount, totalExpenseAmount) &&
            const DeepCollectionEquality()
                .equals(other.averageExpenseAmount, averageExpenseAmount) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalExpenseAmount),
      const DeepCollectionEquality().hash(averageExpenseAmount),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$ExpenseReportOnTimePeroidCopyWith<_ExpenseReportOnTimePeroid>
      get copyWith =>
          __$ExpenseReportOnTimePeroidCopyWithImpl<_ExpenseReportOnTimePeroid>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseReportOnTimePeroidToJson(this);
  }
}

abstract class _ExpenseReportOnTimePeroid implements ExpenseReportOnTimePeroid {
  const factory _ExpenseReportOnTimePeroid(
      {required num totalExpenseAmount,
      required num averageExpenseAmount,
      required DateTime date}) = _$_ExpenseReportOnTimePeroid;

  factory _ExpenseReportOnTimePeroid.fromJson(Map<String, dynamic> json) =
      _$_ExpenseReportOnTimePeroid.fromJson;

  @override
  num get totalExpenseAmount;
  @override
  num get averageExpenseAmount;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$ExpenseReportOnTimePeroidCopyWith<_ExpenseReportOnTimePeroid>
      get copyWith => throw _privateConstructorUsedError;
}

ReportElement _$ReportElementFromJson(Map<String, dynamic> json) {
  return _ReportElement.fromJson(json);
}

/// @nodoc
class _$ReportElementTearOff {
  const _$ReportElementTearOff();

  _ReportElement call(
      {@JsonKey(name: "_id") required String id,
      num totalExpense = 0,
      num averageExpenseAmount = 0,
      num maximumExpenseAmount = 0,
      String currency = "NRS",
      num monthlyIncome = 0}) {
    return _ReportElement(
      id: id,
      totalExpense: totalExpense,
      averageExpenseAmount: averageExpenseAmount,
      maximumExpenseAmount: maximumExpenseAmount,
      currency: currency,
      monthlyIncome: monthlyIncome,
    );
  }

  ReportElement fromJson(Map<String, Object?> json) {
    return ReportElement.fromJson(json);
  }
}

/// @nodoc
const $ReportElement = _$ReportElementTearOff();

/// @nodoc
mixin _$ReportElement {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  num get totalExpense => throw _privateConstructorUsedError;
  num get averageExpenseAmount => throw _privateConstructorUsedError;
  num get maximumExpenseAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  num get monthlyIncome => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportElementCopyWith<ReportElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportElementCopyWith<$Res> {
  factory $ReportElementCopyWith(
          ReportElement value, $Res Function(ReportElement) then) =
      _$ReportElementCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "_id") String id,
      num totalExpense,
      num averageExpenseAmount,
      num maximumExpenseAmount,
      String currency,
      num monthlyIncome});
}

/// @nodoc
class _$ReportElementCopyWithImpl<$Res>
    implements $ReportElementCopyWith<$Res> {
  _$ReportElementCopyWithImpl(this._value, this._then);

  final ReportElement _value;
  // ignore: unused_field
  final $Res Function(ReportElement) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? totalExpense = freezed,
    Object? averageExpenseAmount = freezed,
    Object? maximumExpenseAmount = freezed,
    Object? currency = freezed,
    Object? monthlyIncome = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalExpense: totalExpense == freezed
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as num,
      averageExpenseAmount: averageExpenseAmount == freezed
          ? _value.averageExpenseAmount
          : averageExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      maximumExpenseAmount: maximumExpenseAmount == freezed
          ? _value.maximumExpenseAmount
          : maximumExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyIncome: monthlyIncome == freezed
          ? _value.monthlyIncome
          : monthlyIncome // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$ReportElementCopyWith<$Res>
    implements $ReportElementCopyWith<$Res> {
  factory _$ReportElementCopyWith(
          _ReportElement value, $Res Function(_ReportElement) then) =
      __$ReportElementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "_id") String id,
      num totalExpense,
      num averageExpenseAmount,
      num maximumExpenseAmount,
      String currency,
      num monthlyIncome});
}

/// @nodoc
class __$ReportElementCopyWithImpl<$Res>
    extends _$ReportElementCopyWithImpl<$Res>
    implements _$ReportElementCopyWith<$Res> {
  __$ReportElementCopyWithImpl(
      _ReportElement _value, $Res Function(_ReportElement) _then)
      : super(_value, (v) => _then(v as _ReportElement));

  @override
  _ReportElement get _value => super._value as _ReportElement;

  @override
  $Res call({
    Object? id = freezed,
    Object? totalExpense = freezed,
    Object? averageExpenseAmount = freezed,
    Object? maximumExpenseAmount = freezed,
    Object? currency = freezed,
    Object? monthlyIncome = freezed,
  }) {
    return _then(_ReportElement(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalExpense: totalExpense == freezed
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as num,
      averageExpenseAmount: averageExpenseAmount == freezed
          ? _value.averageExpenseAmount
          : averageExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      maximumExpenseAmount: maximumExpenseAmount == freezed
          ? _value.maximumExpenseAmount
          : maximumExpenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyIncome: monthlyIncome == freezed
          ? _value.monthlyIncome
          : monthlyIncome // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportElement implements _ReportElement {
  const _$_ReportElement(
      {@JsonKey(name: "_id") required this.id,
      this.totalExpense = 0,
      this.averageExpenseAmount = 0,
      this.maximumExpenseAmount = 0,
      this.currency = "NRS",
      this.monthlyIncome = 0});

  factory _$_ReportElement.fromJson(Map<String, dynamic> json) =>
      _$$_ReportElementFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @JsonKey()
  @override
  final num totalExpense;
  @JsonKey()
  @override
  final num averageExpenseAmount;
  @JsonKey()
  @override
  final num maximumExpenseAmount;
  @JsonKey()
  @override
  final String currency;
  @JsonKey()
  @override
  final num monthlyIncome;

  @override
  String toString() {
    return 'ReportElement(id: $id, totalExpense: $totalExpense, averageExpenseAmount: $averageExpenseAmount, maximumExpenseAmount: $maximumExpenseAmount, currency: $currency, monthlyIncome: $monthlyIncome)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportElement &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.totalExpense, totalExpense) &&
            const DeepCollectionEquality()
                .equals(other.averageExpenseAmount, averageExpenseAmount) &&
            const DeepCollectionEquality()
                .equals(other.maximumExpenseAmount, maximumExpenseAmount) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.monthlyIncome, monthlyIncome));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(totalExpense),
      const DeepCollectionEquality().hash(averageExpenseAmount),
      const DeepCollectionEquality().hash(maximumExpenseAmount),
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(monthlyIncome));

  @JsonKey(ignore: true)
  @override
  _$ReportElementCopyWith<_ReportElement> get copyWith =>
      __$ReportElementCopyWithImpl<_ReportElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportElementToJson(this);
  }
}

abstract class _ReportElement implements ReportElement {
  const factory _ReportElement(
      {@JsonKey(name: "_id") required String id,
      num totalExpense,
      num averageExpenseAmount,
      num maximumExpenseAmount,
      String currency,
      num monthlyIncome}) = _$_ReportElement;

  factory _ReportElement.fromJson(Map<String, dynamic> json) =
      _$_ReportElement.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  num get totalExpense;
  @override
  num get averageExpenseAmount;
  @override
  num get maximumExpenseAmount;
  @override
  String get currency;
  @override
  num get monthlyIncome;
  @override
  @JsonKey(ignore: true)
  _$ReportElementCopyWith<_ReportElement> get copyWith =>
      throw _privateConstructorUsedError;
}
