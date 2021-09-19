import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poc_module/components/behavior_without_glow.dart';
import 'package:flutter_poc_module/models/collaborator_model.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  /// Lista de collaboratores das traduções
  List<Collaborator> _collaborators = [
    Collaborator(name: 'Victor Moura', rule: 'Tradução espanhola'),
    Collaborator(name: 'Xavier and Rindra', rule: 'Tradução francesa'),
    Collaborator(name: 'Marcel Suttmeyer | Stephane', rule: 'Tradução alemã'),
    Collaborator(name: 'ShadowDweller', rule: 'Tradução russa'),
  ];

  /// Título dinâmico das seções
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  /// Versão do app
  Widget _buildVersionInfo() {

    String version = '5.8.0';
    String date = '202108261938';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Versão $version',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  /// Lista de colaboradores das traduções
  Widget _buildCollaboratorInfo(){
    return ScrollConfiguration(
      behavior: BehaviorWithoutGlow(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _collaborators.length,
        itemBuilder: (BuildContext context, int index) {
          Collaborator colab = _collaborators[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                colab.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                colab.rule,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Divider()
            ],
          );
        },
      ),
    );
  }

  /// Informação sobre o Mobills Labs
  Widget _buildMobillsLabsInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Mobills foi desenvolvido por Mobills Labs.',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Theme.of(context).disabledColor,
        ),
      ),
    );
  }

  /// Botão para fechar a página atual
  Widget _buildBackButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          SystemNavigator.pop();
        },
        child: Icon(
          Icons.chevron_left_rounded,
          size: 36.0,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true,
        elevation: 0.0,
        leading: _buildBackButton()
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSectionTitle('Sobre'),
            _buildVersionInfo(),
            SizedBox( height: 18.0 ),
            _buildSectionTitle('Créditos'),
            _buildCollaboratorInfo(),
            _buildMobillsLabsInfo(),
          ],
        ),
      ),
    );
  }
}
