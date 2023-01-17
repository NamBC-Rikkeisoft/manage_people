import 'dart:convert';

class Result {
    Result({
      this.body,
      this.status
    });

    String? body;
    bool? status;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    factory Result.fromMap(List<dynamic> json) => Result(
        // status: json["status"] == null
        //     ? null
        //     : json["status"] == 200 || json["status"] == 201,
        // body: json["body"]
        body: json.toString()
      );

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
        "status": status,
        "body": body
      };
}