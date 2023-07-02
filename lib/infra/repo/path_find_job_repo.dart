import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePathInFirebase{

  Map<String, List<List<Map<String, String>>>>  map_all_jobs_paths = {
    "Plumber": [
      [
        {
          "field_name": "What do you need help with?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Water filters and softeners",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
        {
          "field_name": "Drains",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
      ],
      [
        {
          "field_name": "Do you know exactly what the problem is?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Yes",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },
      ],
      [
        {
          "field_name": "What is an inpection?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },

      ],
      [
        {
          "field_name": "What kind of drain help do you need?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Clean or unclog a drain",
          "next_list_id": "5",
          "field_type": "multiple choice",
        },
      ],
    ],
    "Pest Control": [
      [
        {
          "field_name": "What do you need help with?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Water filters and softeners",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
        {
          "field_name": "Drains",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
      ],
      [
        {
          "field_name": "Do you know exactly what the problem is?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Yes",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },
      ],
      [
        {
          "field_name": "What is an inpection?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },

      ],
      [
        {
          "field_name": "What kind of drain help do you need?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Clean or unclog a drain",
          "next_list_id": "5",
          "field_type": "multiple choice",
        },
      ],
    ],
    "Roofing": [
      [
        {
          "field_name": "What do you need help with?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Water filters and softeners",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
        {
          "field_name": "Drains",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
      ],
      [
        {
          "field_name": "Do you know exactly what the problem is?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Yes",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },
      ],
      [
        {
          "field_name": "What is an inpection?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },

      ],
      [
        {
          "field_name": "What kind of drain help do you need?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Clean or unclog a drain",
          "next_list_id": "5",
          "field_type": "multiple choice",
        },
      ],
    ],
    "Salon": [
      [
        {
          "field_name": "What do you need help with?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Water filters and softeners",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
        {
          "field_name": "Drains",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
      ],
      [
        {
          "field_name": "Do you know exactly what the problem is?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Yes",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },
      ],
      [
        {
          "field_name": "What is an inpection?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },

      ],
      [
        {
          "field_name": "What kind of drain help do you need?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Clean or unclog a drain",
          "next_list_id": "5",
          "field_type": "multiple choice",
        },
      ],
    ],
    "Computer Repair": [
      [
        {
          "field_name": "What do you need help with?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Water filters and softeners",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
        {
          "field_name": "Drains",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
      ],
      [
        {
          "field_name": "Do you know exactly what the problem is?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Yes",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },
      ],
      [
        {
          "field_name": "What is an inpection?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },

      ],
      [
        {
          "field_name": "What kind of drain help do you need?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Clean or unclog a drain",
          "next_list_id": "5",
          "field_type": "multiple choice",
        },
      ],
    ],
    "Ac Repair": [
      [
        {
          "field_name": "What do you need help with?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Water filters and softeners",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
        {
          "field_name": "Drains",
          "next_list_id": "2",
          "field_type": "checkbox",
        },
      ],
      [
        {
          "field_name": "Do you know exactly what the problem is?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Yes",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },
      ],
      [
        {
          "field_name": "What is an inpection?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
          "next_list_id": "4",
          "field_type": "multiple choice",
        },

      ],
      [
        {
          "field_name": "What kind of drain help do you need?",
          "next_list_id": "",
          "field_type": "",
        },
        {
          "field_name": "Clean or unclog a drain",
          "next_list_id": "5",
          "field_type": "multiple choice",
        },
      ],
    ],
  };

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((RegExpMatch match) =>  print(match.group(0)));
  }
  Future<void> createPath() async {
    printLongString(jsonEncode(map_all_jobs_paths));
    /*try {
      //var json_result = map_all_jobs_paths.toJson();
      //json_result["create_at"] = DateTime.now();

      final response = await _db.collection('path_find_service').add(map_all_jobs_paths);
      return response.id;
    } catch (e, stackTrace) {
      return Future.error("Erro ao tentar Cadastrar", stackTrace);
    }*/
  }
}
List<Map<String,String>> list_one = [
    {
      "field_name": "What do you need help with?",
      "next_list_id": "",
      "field_type": "",
    },
    {
      "field_name": "Water filters and softeners",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
    {
      "field_name": "Drains",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
    {
      "field_name": "Sump pump",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
    {
      "field_name": "Sink, toilet, bathtub or other water fixture",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
    {
      "field_name": "Water or gas leak",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
    {
      "field_name": "Water heater",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
    {
      "field_name": "Water or gas appliance hookup",
      "next_list_id": "2",
      "field_type": "checkbox",
    },
  ];

  List<Map<String,String>> list_Two = [
    {
      "field_name": "Do you know exactly what the problem is?",
      "next_list_id": "",
      "field_type": "",
    },
    {
      "field_name": "Yes",
      "next_list_id": "4",
      "field_type": "multiple choice",
    },
    {
      "field_name": "No (I want an inspection from a professional)",
      "next_list_id": "3",
      "field_type": "multiple choice",
    },
  ];
  List<Map<String,String>> list_Three = [
    {
      "field_name": "What is an inpection?",
      "next_list_id": "",
      "field_type": "",
    },
    {
      "field_name": "At the end of the process it will be charged a 100 dollars inspection fee The fee will be later deducted from the price of the service.",
      "next_list_id": "4",
      "field_type": "multiple choice",
    },

  ];
  List<Map<String,String>> list_Four = [
    {
      "field_name": "What kind of drain help do you need?",
      "next_list_id": "",
      "field_type": "",
    },
    {
      "field_name": "Clean or unclog a drain",
      "next_list_id": "5",
      "field_type": "multiple choice",
    },
    {

      "field_name": " Install a new drain",
      "next_list_id": "5",
      "field_type": "multiple choice",
    },

  ];
  List<Map<String,String>> list_Five = [
    {
      "field_name": "How many drains do you want to install?",
      "next_list_id": "",
      "field_type": "",
    },
    {
      "field_name": "One",
      "next_list_id": "6",
      "field_type": "multiple choice",
    },
    {
      "field_name": "Two",
      "next_list_id": "6",
      "field_type": "multiple choice",
    },

    {
      "field_name": "Three or more",
      "next_list_id": "6",
      "field_type": "multiple choice",
    },
  ];
  List<Map<String,String>> list_Six = [
    {
      "field_name": "What kind of drain help do you need?",
      "next_list_id": "",
      "field_type": "",
    },
    {
      "field_name": "Clean or unclog a drain",
      "next_list_id": "7",
      "field_type": "multiple choice",
    },
    {
      "field_name": " Install a new drain",
      "next_list_id": "7",
      "field_type": "multiple choice",
    },

    {
      "field_name": " Install a new drain",
      "next_list_id": "7",
      "field_type": "multiple choice",
    },
    {
      "field_name": " Install a new drain",
      "next_list_id": "7",
      "field_type": "multiple choice",
    },

    {
      "field_name": " Install a new drain",
      "next_list_id": "7",
      "field_type": "multiple choice",
    },
  ];



