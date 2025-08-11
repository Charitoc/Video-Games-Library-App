import 'package:igdb_app/search_page/data/entities/term_result_dto.dart';

class GameMapper {
  static int from(TermResultDTO termResultDTO) {
    return termResultDTO.id;
  }
}
