
class HomeModel {
    String? message;
    Data? data;

    HomeModel({
        this.message,
        this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<ListElement>? list;

    Data({
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? userId;
    String? contact;
    String? name;
    String? details;
    int? localType;
    int? createdAt;
    int? status;
    String? id;
    int? v;

    ListElement({
        this.userId,
        this.contact,
        this.name,
        this.details,
        this.localType,
        this.createdAt,
        this.status,
        this.id,
        this.v,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        userId: json["_userId"],
        contact: json["_contact"],
        name: json["_name"],
        details: json["_details"],
        localType: json["_localType"],
        createdAt: json["_createdAt"],
        status: json["_status"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_userId": userId,
        "_contact": contact,
        "_name": name,
        "_details": details,
        "_localType": localType,
        "_createdAt": createdAt,
        "_status": status,
        "_id": id,
        "__v": v,
    };
}
