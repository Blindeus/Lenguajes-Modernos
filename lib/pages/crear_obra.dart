import 'package:flutter/material.dart';

class Create_obra extends StatefulWidget {
  @override
  State<Create_obra> createState() => _CreateObraState();
}

class _CreateObraState extends State<Create_obra> {
  final _formkey = GlobalKey<FormState>();

  late String nombre_obra;
  late String presupuesto_estimado;
  late String presupuesto_gastado;
  late String fecha_entrega;

  final List<String> errors = [];

  void removeError({required String error}) {
    if (error.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!error.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            _buildNameformField(),
            _buildPresupuestoEstimadoformField(),
            _buldPresupuestoGastadoformField(),
            _buildFechaEntregaformField(),
            TextButton(
                child: const Text('Crear Obra'),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    print("Guardar");
                  }
                })
          ],
        ));
  }

  TextFormField _buildNameformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => nombre_obra = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'nombre invalido');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'nombre invalido');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Nombre",
        hintText: "Obra Numero 1",
      ),
    );
  }

  TextFormField _buildPresupuestoEstimadoformField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => presupuesto_estimado = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'nombre invalido');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'nombre invalido');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Presupuesto Estimado",
        hintText: "4.000.000",
      ),
    );
  }

  TextFormField _buldPresupuestoGastadoformField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => presupuesto_gastado = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'nombre invalido');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'nombre invalido');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Presupuesto Gastado",
        hintText: "2.500.000",
      ),
    );
  }

  TextFormField _buildFechaEntregaformField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      onSaved: (newValue) => fecha_entrega = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'Fecha Invalida');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'Fecha Invalida');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Fecha Obra",
        hintText: "24 de mayo 2022",
      ),
    );
  }
}
