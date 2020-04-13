class Data {
  String country;
  String totalCases;
  String totalRecovered;
  String totalDeaths;
  String newCases;
  String newDeaths;
  String activeCases;

  String totalTests;
  String continent;
  String deaths1Mpop;
  String seriousCritical;
  String tests1MPop;
  String totCases1MPop;

  Data(
      {this.country,
      this.totalCases,
      this.totalRecovered,
      this.totalDeaths,
      this.newCases,
      this.newDeaths,
      this.activeCases,
      this.totalTests,
      this.continent,
      this.deaths1Mpop,
      this.seriousCritical,
      this.tests1MPop,
      this.totCases1MPop
      });

  Data.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    totalCases = json['totalCases'];
    totalRecovered = json['totalRecovered'];
    totalDeaths = json['totalDeaths'];
    newCases = json['newCases'];
    newDeaths = json['newDeaths'];
    activeCases = json['activeCases'];
    totalTests = json['totalTests'];
    continent = json['continent'];
    deaths1Mpop = json['deaths_1M_pop'];
    seriousCritical = json['serious_Critical'];
    tests1MPop = json['tests_1M_Pop'];
    totCases1MPop = json['totCases_1M_Pop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['totalCases'] = this.totalCases;
    data['totalRecovered'] = this.totalRecovered;
    data['totalDeaths'] = this.totalDeaths;
    data['newCases'] = this.newCases;
    data['newDeaths'] = this.newDeaths;
    data['activeCases'] = this.activeCases;
    data['totalTests'] = this.totalTests;
    data['continent'] = this.continent;
    data['deaths_1M_pop'] = this.deaths1Mpop;
    data['serious_Critical'] = this.seriousCritical;
    data['tests_1M_Pop'] = this.tests1MPop;
    data['totCases_1M_Pop'] = this.totCases1MPop;
    return data;
  }
}
