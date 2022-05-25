import 'package:flutter/material.dart';

class Update_Obra extends StatefulWidget {
  @override
  State<Update_Obra> createState() => _UpdateObraState();
}

class _UpdateObraState extends State<Update_Obra> {
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
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(''),
                radius: 60,
              ),
            ),
            _buildNameformField(),
            _buildPresupuestoEstimadoformField(),
            _buldPresupuestoGastadoformField(),
            _buildFechaEntregaformField(),
            const SizedBox(height: 50.0),
            TextButton(  
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                child: const Text('Actualizar Datos'),
                onPressed: () {
              if (_formkey.currentState!.validate()) {
                    print("Guardar"); //mensaje "guardar" nos indica que si se envio el formulario.
                  }
                })
          ],
        ));
  }

  TextFormField _buildNameformField() {
    return TextFormField(
      keyboardType:  TextInputType.name,
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
        suffixIcon: Icon(Icons.edit)
      ),
    );
  }

  TextFormField _buildPresupuestoEstimadoformField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => presupuesto_estimado = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'valor invalido');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'valor Invalido');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Presupuesto Estimado",
        hintText: "4.000.000",
        suffixIcon: Icon(Icons.edit)
      ),
    );
  }

  TextFormField _buldPresupuestoGastadoformField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => presupuesto_gastado = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'valor Invalido');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'valor Invalido');
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Presupuesto Gastado",
        hintText: "2.500.000",
        suffixIcon: Icon(Icons.edit)
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
        suffixIcon: Icon(Icons.edit)
      ),
    );
  }
}