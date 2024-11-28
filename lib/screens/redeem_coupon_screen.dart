import 'package:superrewards/models/CouponCode.dart';
import '../utils/exporter.dart';

class RedeemCouponScreen extends StatelessWidget {
  RedeemCouponScreen({super.key});

  final _couponCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(strRedeemCode, true, onBackPress: context.onBackPress),
      body: createDefaultPadding(child: _createListOfItems(context)),
    );
  }

  Card _createSubmitCoupon(BuildContext context) {
    return Card(
      elevation: padding_12,
      child: createDefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createCouponCodeInputField(strEnterCouponCode),
            const SizedBox(height: padding_16),
            createDefaultElevatedButton(context, strSubmit, () {
              context.showDialogOnClick(strCongratulations, strCouponReedemed,
                  onDialogButtonClick: _couponCodeController.clear);
            }),
          ],
        ),
      ),
    );
  }

  TextFormField _createCouponCodeInputField(String hint) => TextFormField(
        controller: _couponCodeController,
        autovalidateMode: null,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: const TextStyle(color: colorGrey),
          focusedBorder: outlineInputBorder(colorGrey),
          enabledBorder: outlineInputBorder(colorGrey),
        ),
      );

  FutureBuilder<List<CouponCode>> _createListOfItems(BuildContext context) {
    return FutureBuilder(
        future: loadCouponData(),
        builder: (context, snapshot) {
          return Column(
            children: [
              _createSubmitCoupon(context),
              Expanded(child: _createCouponCodeList(snapshot)),
            ],
          );
        });
  }

  ListView _createCouponCodeList(AsyncSnapshot<List<CouponCode>> snapshot) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        final item = snapshot.data?[index];
        return ListTile(
          title: Text(getDefaultStringOrEmpty(item?.title)),
          subtitle: Text(getDefaultStringOrEmpty(item?.code),
              style: const TextStyle(color: colorGrey)),
          trailing: createDefaultElevatedButton(context, strApply, () {
            context.showDialogOnClick(strCongratulations, strCouponReedemed);
          }),
        );
      },
      itemCount: snapshot.data?.length,
    );
  }
}
