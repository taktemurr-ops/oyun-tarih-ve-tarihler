import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tarih_ve_tarihler/oyun_tarih_ve_tarihler.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tarihVeTarihlerConfig.title.length, 33);
    expect(tarihVeTarihlerConfig.tagline.length, 33);
    for (final s in tarihVeTarihlerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(tarihVeTarihlerConfig.gameId, tarihVeTarihlerId);
    expect(tarihVeTarihlerRules.gameId, tarihVeTarihlerId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tarihVeTarihlerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tarihVeTarihlerId, optionalMechanics: tarihVeTarihlerRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tarihVeTarihlerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
