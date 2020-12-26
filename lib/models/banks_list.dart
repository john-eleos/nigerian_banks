
/// [bankList] a string with json list of banks

String bankList = """
[
  {
    "name":"Access Bank",
    "slug":"access-bank",
    "code":"044",
    "ussd":"*901#",
    "logo":"assets/images/access-bank.png"},
  {
    "name":"Access Bank (Diamond)",
    "slug":"access-bank-diamond",
    "code":"063",
    "ussd":"*426#",
    "logo":"assets/images/access-bank-diamond.png"},
  {
    "name":"ALAT by WEMA",
    "slug":"alat-by-wema",
    "code":"035A",
    "ussd":"*945*100#",
    "logo":"assets/images/alat-by-wema.png"},
  {
    "name":"ASO Savings and Loans",
    "slug":"asosavings",
    "code":"401",
    "ussd":"",
    "logo":"assets/images/asosavings.png"},
  {
    "name":"Bowen Microfinance Bank",
    "slug":"bowen-microfinance-bank",
    "code":"50931",
    "ussd":"",
    "logo":"assets/images/bowen-microfinance-bank.png"},
  {
    "name":"CEMCS Microfinance Bank",
    "slug":"cemcs-microfinance-bank",
    "code":"50823",
    "ussd":"",
    "logo":"assets/images/cemcs-microfinance-bank.png"},
  {
    "name":"Citibank Nigeria",
    "slug":"citibank-nigeria",
    "code":"023",
    "ussd":"",
    "logo":"assets/images/citibank-nigeria.png"},
  {
    "name":"Ecobank Nigeria",
    "slug":"ecobank-nigeria",
    "code":"050",
    "ussd":"*326#",
    "logo":"assets/images/ecobank-nigeria.png"},
  {
    "name":"Ekondo Microfinance Bank",
    "slug":"ekondo-microfinance-bank",
    "code":"562",
    "ussd":"*540*178#",
    "logo":"assets/images/ekondo-microfinance-bank.png"},
  {
    "name":"Fidelity Bank",
    "slug":"fidelity-bank",
    "code":"070",
    "ussd":"*770#",
    "logo":"assets/images/fidelity-bank.png"},
  {
    "name":"First Bank of Nigeria",
    "slug":"first-bank-of-nigeria",
    "code":"011",
    "ussd":"*894#",
    "logo":"assets/images/first-bank-of-nigeria.png"},
  {
    "name":"First City Monument Bank",
    "slug":"first-city-monument-bank",
    "code":"214",
    "ussd":"*329#",
    "logo":"assets/images/first-city-monument-bank.png"},
  {
    "name":"Globus Bank",
    "slug":"globus-bank",
    "code":"00103",
    "ussd":"*989#",
    "logo":"assets/images/globus-bank.png"},
  {
    "name":"Guaranty Trust Bank",
    "slug":"guaranty-trust-bank",
    "code":"058",
    "ussd":"*737#",
    "logo":"assets/images/guaranty-trust-bank.png"},
  {
    "name":"Hasal Microfinance Bank",
    "slug":"hasal-microfinance-bank",
    "code":"50383",
    "ussd":"*322*127#",
    "logo":"assets/images/hasal-microfinance-bank.png"},
  {
    "name":"Heritage Bank",
    "slug":"heritage-bank",
    "code":"030",
    "ussd":"*322#",
    "logo":"assets/images/heritage-bank.png"},
  {
    "name":"Jaiz Bank",
    "slug":"jaiz-bank",
    "code":"301",
    "ussd":"*389*301#",
    "logo":"assets/images/jaiz-bank.png"},
  {
    "name":"Keystone Bank",
    "slug":"keystone-bank",
    "code":"082",
    "ussd":"*7111#",
    "logo":"assets/images/keystone-bank.png"},
  {
    "name":"Kuda Bank",
    "slug":"kuda-bank",
    "code":"50211",
    "ussd":"",
    "logo":"assets/images/kuda-bank.png"},
  {
    "name":"One Finance",
    "slug":"one-finance",
    "code":"565",
    "ussd":"*1303#",
    "logo":"assets/images/one-finance.png"},
  {
    "name":"Parallex Bank",
    "slug":"parallex-bank",
    "code":"526",
    "ussd":"*322*318*0#",
    "logo":"assets/images/parallex-bank.png"},
  {
    "name":"Polaris Bank",
    "slug":"polaris-bank",
    "code":"076",
    "ussd":"*833#",
    "logo":"assets/images/polaris-bank.png"},
  {
    "name":"Providus Bank",
    "slug":"providus-bank",
    "code":"101",
    "ussd":"",
    "logo":"assets/images/providus-bank.png"},
  {
    "name":"Rubies MFB",
    "slug":"rubies-mfb",
    "code":"125",
    "ussd":"*7797#",
    "logo":"assets/images/rubies-mfb.png"},
  {
    "name":"Sparkle Microfinance Bank",
    "slug":"sparkle-microfinance-bank",
    "code":"51310",
    "ussd":"",
    "logo":"assets/images/sparkle-microfinance-bank.png"},
  {
    "name":"Stanbic IBTC Bank",
    "slug":"stanbic-ibtc-bank",
    "code":"221",
    "ussd":"*909#",
    "logo":"assets/images/stanbic-ibtc-bank.png"},
  {
    "name":"Standard Chartered Bank",
    "slug":"standard-chartered-bank",
    "code":"068",
    "ussd":"",
    "logo":"assets/images/standard-chartered-bank.png"},
  {
    "name":"Sterling Bank",
    "slug":"sterling-bank",
    "code":"232",
    "ussd":"*822#",
    "logo":"assets/images/sterling-bank.png"},
  {
    "name":"Suntrust Bank",
    "slug":"suntrust-bank",
    "code":"100",
    "ussd":"*5230#",
    "logo":"assets/images/suntrust-bank.png"},
  {
    "name":"TAJ Bank",
    "slug":"taj-bank",
    "code":"302",
    "ussd":"*898#",
    "logo":"assets/images/taj-bank.png"},
  {
    "name":"TCF MFB",
    "slug":"tcf-mfb",
    "code":"51211",
    "ussd":"*908#",
    "logo":"assets/images/tcf-mfb.png"},
  {
    "name":"Titan Trust Bank",
    "slug":"titan-trust-bank",
    "code":"102",
    "ussd":"*922#",
    "logo":"assets/images/titan-trust-bank.png"},
  {
    "name":"Union Bank of Nigeria",
    "slug":"union-bank-of-nigeria",
    "code":"032",
    "ussd":"*826#",
    "logo":"assets/images/union-bank-of-nigeria.png"},
  {
    "name":"United Bank For Africa",
    "slug":"united-bank-for-africa",
    "code":"033",
    "ussd":"*919#",
    "logo":"assets/images/united-bank-for-africa.png"},
  {
    "name":"Unity Bank",
    "slug":"unity-bank",
    "code":"215",
    "ussd":"*7799#",
    "logo":"assets/images/unity-bank.png"},
  {
    "name":"VFD",
    "slug":"vfd",
    "code":"566",
    "ussd":"",
    "logo":"assets/images/vfd.png"},
  {
    "name":"Wema Bank",
    "slug":"wema-bank",
    "code":"035",
    "ussd":"*945#",
    "logo":"assets/images/wema-bank.png"},
  {
    "name":"Zenith Bank",
    "slug":"zenith-bank",
    "code":"057",
    "ussd":"*966#",
    "logo":"assets/images/zenith-bank.png"
  }
]
""";
