import 'package:api/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../gql_data.dart';
import '../graphql/mutation.gql.dart';
import '../graphql/query.gql.dart';

import 'public.dart';

class Api {
  static AuthApi get auth => AuthApi();
  static PublicApi get public => PublicApi();
  static Queries get queries => Queries();
  static Mutations get mutations => Mutations();
  static UserSubscriptions get subs => UserSubscriptions();
}

class Queries {
  Future<Fragment$Journey?> journey(String id) async {
    final res = await throwIfException(
      client.query$GetJourney(
        Options$Query$GetJourney(variables: Variables$Query$GetJourney(id: id)),
      ),
    );
    return res.user.journey;
  }

  Future<List<Fragment$Journey>> journeys() async {
    final res = await throwIfException(
      client.query$GetMyJourneys(Options$Query$GetMyJourneys()),
    );
    return res.user.my_journeys.items;
  }

  Future<({List<Fragment$Stage> items, Fragment$PageInfo pageInfo})>
  journeyStages(String journeyId, [Input$PaginationInput? pagination]) async {
    final res = await throwIfException(
      client.query$GetStages(
        Options$Query$GetStages(
          variables: Variables$Query$GetStages(
            journeyId: journeyId,
            pagination: pagination,
          ),
        ),
      ),
    );

    final jr = throwIfNull(res.user.journey);

    return (items: jr.stages.items, pageInfo: jr.stages.pageInfo);
  }

  Future<Fragment$DetailedMaterial> detailedMaterial(String id) async {
    final res = await throwIfException(
      client.query$GetMaterialDetails(
        Options$Query$GetMaterialDetails(
          variables: Variables$Query$GetMaterialDetails(id: id),
        ),
      ),
    );
    return throwIfNull(res.user.material);
  }

  Future<Fragment$Material> material(String id) async {
    final res = await throwIfException(
      client.query$GetMaterial(
        Options$Query$GetMaterial(
          variables: Variables$Query$GetMaterial(id: id),
        ),
      ),
    );
    return throwIfNull(res.user.material);
  }

  Future<List<Fragment$ConversationTurn>> conversationTurns(
    String materialId,
  ) async {
    final res = await throwIfException(
      client.query$GetConversationTurns(
        Options$Query$GetConversationTurns(
          variables: Variables$Query$GetConversationTurns(
            materialId: materialId,
          ),
        ),
      ),
    );
    return res.user.conversation_turns;
  }

  Future<LinguisticUnitSet> parsedUnits(String text, String journeyId) async {
    final res = await throwIfException(
      client.query$ParsedUnits(
        Options$Query$ParsedUnits(
          variables: Variables$Query$ParsedUnits(
            text: text,
            journeyId: journeyId,
          ),
        ),
      ),
    );
    return res.user.parsed_units;
  }

  Future<Fragment$UserDoc> documentation(Input$DocumentationInput input) async {
    final res = await throwIfException(
      client.query$GetDocumentation(
        Options$Query$GetDocumentation(
          fetchPolicy: FetchPolicy.networkOnly,
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
          variables: Variables$Query$GetDocumentation(input: input),
        ),
      ),
    );
    return res.user.documentation;
  }

  // Future<({List<Fragment$Material> items, Fragment$PageInfo pageInfo})>
  // materials(
  //   String journeyId,
  //   String pathID,
  //   Input$PaginationInput pagination,
  // ) async {
  //   final res = await throwIfException(
  //     client.query$GetPathMaterials(
  //       Options$Query$GetPathMaterials(
  //         variables: Variables$Query$GetPathMaterials(
  //           pagination: pagination,
  //           journeyId: journeyId,
  //           pathID: pathID,
  //         ),
  //       ),
  //     ),
  //   );

  //   return (
  //     items: res.user.path_materials.items,
  //     pageInfo: res.user.path_materials.pageInfo,
  //   );
  // }

  Future<List<Fragment$ModelSet>> modelSets() async {
    final res = await throwIfException(
      client.query$GetModelSets(Options$Query$GetModelSets()),
    );
    return res.user.model_sets.items;
  }

  Future<Fragment$UserDoc> userDoc(String id) async {
    final res = await throwIfException(
      client.query$GetUserDoc(
        Options$Query$GetUserDoc(variables: Variables$Query$GetUserDoc(id: id)),
      ),
    );
    return res.user.user_doc;
  }

  Future<Fragment$DetailedStage> stage(String journeyId, String stageId) async {
    final res = await throwIfException(
      client.query$GetStageDetailed(
        Options$Query$GetStageDetailed(
          variables: Variables$Query$GetStageDetailed(
            journeyId: journeyId,
            stageId: stageId,
          ),
        ),
      ),
    );
    return throwIfNull(res.user.stage);
  }

  Future<List<Fragment$DetailedSupportedLanguage>> supportedLanguages() async {
    final res = await throwIfException(
      client.query$GetSupportedLanguages(Options$Query$GetSupportedLanguages()),
    );
    return res.user.supported_languages.items;
  }

  Future<List<Fragment$SupportedLocale>> supportedLocales() async {
    final res = await throwIfException(
      client.query$GetSupportedLocales(Options$Query$GetSupportedLocales()),
    );
    return res.user.supported_locales.items;
  }
}

typedef CreateJourneyInput = Variables$Mutation$CreateJourney;
typedef UpdateJourneyInput = Variables$Mutation$UpdateJourney;

class Mutations {
  Future<Fragment$Journey> createJourney(CreateJourneyInput input) async {
    try {
      final res = await throwIfException(
        client.mutate$CreateJourney(
          Options$Mutation$CreateJourney(variables: input),
        ),
      );
      return res.user.create_journey;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Fragment$Journey> updateJourney(
    String id,
    UpdateJourneyInput input,
  ) async {
    final res = await throwIfException(
      client.mutate$UpdateJourney(
        Options$Mutation$UpdateJourney(variables: input),
      ),
    );
    return res.user.update_journey;
  }

  Future<bool> deleteJourney(String id) async {
    final res = await throwIfException(
      client.mutate$DeleteJourney(
        Options$Mutation$DeleteJourney(
          variables: Variables$Mutation$DeleteJourney(id: id),
        ),
      ),
    );
    return res.user.delete_journey;
  }

  Future<Fragment$ConversationTurn> addConversationTurn(
    String materialId,
    String? text,
    Uint8List? audio,
  ) async {
    String? audioId;
    if (audio != null) {
      final uploaded = await uploadAudio(audio, "audio/wav");
      audioId = uploaded;
    }

    final res = await throwIfException(
      client.mutate$AddUserInput(
        Options$Mutation$AddUserInput(
          variables: Variables$Mutation$AddUserInput(
            input: Input$AddUserInputInput(
              materialId: materialId,
              text: text,
              audio_ID: audioId,
            ),
          ),
        ),
      ),
    );
    return res.user.add_user_input;
  }

  // Future<bool> deleteTemp(int $num) async {
  //   final res = await throwIfException(
  //     client.mutate$DeleteTemp(
  //       Options$Mutation$DeleteTemp(
  //         variables: Variables$Mutation$DeleteTemp($num: $num),
  //       ),
  //     ),
  //   );
  //   return res.user.delete_temp;
  // }

  // Future<bool> resetJourney(String id) async {
  //   final res = await throwIfException(
  //     client.mutate$ResetJourney(
  //       Options$Mutation$ResetJourney(
  //         variables: Variables$Mutation$ResetJourney(id: id),
  //       ),
  //     ),
  //   );
  //   return res.user.reset_journey;
  // }

  // Future<bool> clearConversation(String materialId) async {
  //   final res = await throwIfException(
  //     client.mutate$ClearConversation(
  //       Options$Mutation$ClearConversation(
  //         variables: Variables$Mutation$ClearConversation(
  //           materialId: materialId,
  //         ),
  //       ),
  //     ),
  //   );
  //   return res.user.clear_conversation;
  // }

  // Future<bool> removeConversationAssistant() async {
  //   final res = await throwIfException(
  //     client.mutate$RemoveConversationAssistant(
  //       Options$Mutation$RemoveConversationAssistant(),
  //     ),
  //   );
  //   return res.user.remove_conversation_assistant;
  // }

  Future<Fragment$AnswerMaterialResponse> answerMaterial(
    String materialId,
    String stageId,
    String partId,
    Map<String, dynamic> answer,
  ) async {
    for (var key in answer.keys) {
      if (answer[key] is Uint8List) {
        final uploaded = await uploadAudio(answer[key], "audio/wav");
        answer[key] = uploaded;
      }
      if (answer[key] is Map && answer[key]['answer'] is Uint8List) {
        final uploaded = await uploadAudio(answer[key]['answer'], "audio/wav");
        answer[key]['answer'] = uploaded;
      }
    }

    final res = await throwIfException(
      client.mutate$AnswerMaterial(
        Options$Mutation$AnswerMaterial(
          variables: Variables$Mutation$AnswerMaterial(
            input: Input$AnswerMaterialInput(
              materialId: materialId,
              answer: answer,
              stageId: stageId,
              partId: partId,
            ),
          ),
        ),
      ),
    );
    return res.user.answer_material;
  }

  // Future<Fragment$Material> prepareMaterial(String materialId) async {
  //   final res = await throwIfException(
  //     client.mutate$PrepareMaterial(
  //       Options$Mutation$PrepareMaterial(
  //         variables: Variables$Mutation$PrepareMaterial(materialId: materialId),
  //       ),
  //     ),
  //   );
  //   return res.user.prepare_material;
  // }

  // Future<Fragment$Material> regenerateMaterial(String materialId) async {
  //   final res = await throwIfException(
  //     client.mutate$RegenerateMaterial(
  //       Options$Mutation$RegenerateMaterial(
  //         variables: Variables$Mutation$RegenerateMaterial(
  //           materialId: materialId,
  //         ),
  //       ),
  //     ),
  //   );
  //   return res.user.regenerate_material;
  // }

  // Future<Fragment$Material> genMaterial(Input$GenMaterialInput input) async {
  //   final res = await throwIfException(
  //     client.mutate$GenMaterial(
  //       Options$Mutation$GenMaterial(
  //         variables: Variables$Mutation$GenMaterial(input: input),
  //       ),
  //     ),
  //   );
  //   return res.user.gen_material;
  // }
}
