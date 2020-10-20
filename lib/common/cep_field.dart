import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/blocs/cep_bloc.dart';
import 'package:xlo/models/address.dart';

class CepField extends StatefulWidget {

  CepField({this.decoration, this.onSaved});

  final InputDecoration decoration;
  final FormFieldSetter<Address> onSaved;

  @override
  _CepFieldState createState() => _CepFieldState();
}

class _CepFieldState extends State<CepField> {

  InputDecoration get decoration => widget.decoration;
  FormFieldSetter<Address> get onSaved => widget.onSaved;

  CepBloc cepBloc;

  @override
  void initState() {
    super.initState();
    cepBloc = CepBloc();
  }

  @override
  void dispose() {
    cepBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CepBlocState>(
      initialData: CepBlocState(
        cepFieldState: CepFieldState.INITIALIZING,
      ),
      stream: cepBloc.outCep,
      builder: (context, snapshot) {
        if(snapshot.data.cepFieldState == CepFieldState.INITIALIZING)
          return Container();
        return Column(
          children: <Widget>[
            TextFormField(
              initialValue: snapshot.data.cep,
              keyboardType: TextInputType.number,
              decoration: decoration,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              onSaved: (c){
                onSaved(Address());
              },
              onChanged: cepBloc.onCHanged,
              validator: (c){
                switch(snapshot.data.cepFieldState){
                  case CepFieldState.INITIALIZING:
                  case CepFieldState.INCOMPLETE:
                    return 'Campo Obrigatório';
                  case CepFieldState.INVALID:
                    return 'Campo Inválido';
                  case CepFieldState.VALID:
                }
                return null;
              },
            ),
            buildInformation(snapshot.data)
          ],
        );
      }
    );
  }

  Widget buildInformation(CepBlocState blocState) {

  }
}
