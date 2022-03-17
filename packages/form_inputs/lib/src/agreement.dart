import 'package:formz/formz.dart';

enum AgreementValidationError { invalid }

class Agreement extends FormzInput<bool, AgreementValidationError> {
  const Agreement.pure() : super.pure(false);

  const Agreement.dirty([bool value = false]) : super.dirty(value);

  static const bool _agreement = true;

  @override
  AgreementValidationError? validator(bool? value) {
    return _agreement == value ? null : AgreementValidationError.invalid;
  }
}
