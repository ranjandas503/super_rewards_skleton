import 'package:superrewards/models/coupon.dart';
import '../utils/exporter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(strHome, false),
      floatingActionButton: createFloatingButtonView(context),
      body: createDefaultPadding(child: fetchAndCreateGrid(context)),
    );
  }

  FloatingActionButton createFloatingButtonView(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        pushScreen(context, redeemCouponScreen);
      },
      backgroundColor: colorPrimary,
      foregroundColor: colorSecondary,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(padding_32), // Adjust the value as needed
      ),
      child: const Icon(Icons.card_giftcard),
    );
  }

  FutureBuilder<List<Coupon>> fetchAndCreateGrid(BuildContext context) {
    return FutureBuilder<List<Coupon>>(
        future: loadGridData(),
        builder: (context, snapshot) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCellCount,
                mainAxisSpacing: padding_8,
                crossAxisSpacing: padding_8,
              ),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, index) {
                final item = snapshot.data?[index];
                return createGridItem(item, context);
              });
        });
  }

  InkWell createGridItem(Coupon? item, BuildContext context) {
    return InkWell(
      onTap: () {
        context.showDialogOnClick(strCouponCode, generateRandomCoupon());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(padding_12),
          color: colorGridTile,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons[item?.icon]),
              Text(getDefaultStringOrEmpty(item?.title)),
              Text(getDefaultStringOrEmpty(item?.coupon), style: const TextStyle(color: colorGrey, fontSize: textSizeDiscount)),
            ]),
      ),
    );
  }
}
