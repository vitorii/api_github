import 'package:flutter/material.dart';
import 'dart:convert';
import 'api_service.dart';
// import 'package:url_launcher/url_launcher.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  List<dynamic> repositories = [];

  @override
  void initState() {
    super.initState();
    getRepositories();
  }

  void getRepositories() async{
    try {
      var data = await ApiService.getRepositories();
      setState(() {
        repositories = data; // Atualiza a lista de repositórios
      });
    } catch (e) {

    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Repository Vitorii'),
      ),
      body: ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repo = repositories[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  child: ListTile(
                    title: Text(repo['name']),
                    subtitle: Text(repo['description'] ?? 'Sem descrição'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () => _launchURL(repo['html_url']),
                  ),
                );
              },
            ),
    );
  }

  void _launchURL(url){
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Não foi possível abrir o URL $url';
    // }
  }
}
