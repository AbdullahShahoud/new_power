import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/core/networking/api_result.dart';
import 'package:new_power/core/networking/api_service.dart';
import 'package:new_power/features/projects/data/models/actor_view.dart';
import 'package:new_power/features/projects/data/models/enums.dart';
import 'package:new_power/features/projects/data/models/project_view.dart';
import 'package:new_power/features/projects/data/models/projects_list_response.dart';
import 'package:new_power/features/projects/data/repo/projects_repository.dart';
import 'package:new_power/features/projects/logic/projects_bloc/projects_bloc.dart';
import 'package:new_power/features/projects/logic/projects_bloc/projects_event.dart';
import 'package:new_power/features/projects/logic/projects_bloc/projects_state.dart';

/// Never called — `_FakeRepository` overrides every method the tests touch.
/// Present only because `ProjectsRepository` requires an `ApiService`.
class _UnusedApiService implements ApiService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} should not be called');
}

ProjectSummaryView _project(String id, String name) => ProjectSummaryView(
  id: id,
  name: name,
  buildingType: BuildingType.villa,
  description: 'x',
  latitude: 0,
  longitude: 0,
  constructionPhase: ConstructionPhase.blockwork,
  stage: ProjectStage.lead,
  status: ProjectStatus.active,
  ownerId: 'owner',
  version: 1,
  createdAt: DateTime(2026),
  updatedAt: DateTime(2026),
  imageCount: 0,
  activityCount: 0,
  stakeholderCount: 0,
);

/// Hands back a different page on each `list()` call, so a test can tell a
/// genuine re-fetch from a no-op.
class _FakeRepository extends ProjectsRepository {
  _FakeRepository(this._pages) : super(_UnusedApiService());

  final List<List<ProjectSummaryView>> _pages;
  int calls = 0;

  @override
  Future<ApiResult<ProjectsListResponse>> list({
    int? page,
    int? limit,
    ProjectStage? stage,
    ProjectStatus? status,
    ConstructionPhase? constructionPhase,
    BuildingType? buildingType,
    String? territoryId,
    String? search,
    DateTime? updatedSince,
    String? near,
  }) async {
    final data = _pages[calls.clamp(0, _pages.length - 1)];
    calls++;
    return ApiResult.success(
      ProjectsListResponse(
        data: data,
        pagination: const PaginationMeta(
          total: 1,
          page: 1,
          limit: 20,
          totalPages: 1,
        ),
      ),
    );
  }
}

void main() {
  group('ProjectsBloc — pull to refresh', () {
    test('listRefreshed re-fetches and replaces the rows on screen', () async {
      final repo = _FakeRepository([
        [_project('a', 'first load')],
        [_project('a', 'first load'), _project('b', 'added elsewhere')],
      ]);
      final bloc = ProjectsBloc(repo);

      bloc.add(const ProjectsEvent.listRequested());
      await bloc.stream.firstWhere(
        (s) => s.listStatus == PagedFeedStatus.loaded,
      );
      expect(bloc.state.projects.length, 1);

      bloc.add(const ProjectsEvent.listRefreshed());
      await bloc.stream.firstWhere(
        (s) => s.listStatus == PagedFeedStatus.loaded,
      );

      // The refresh must hit the network again...
      expect(repo.calls, 2, reason: 'refresh should re-request page 1');
      // ...and the new row must actually reach the state.
      expect(bloc.state.projects.length, 2);
      expect(bloc.state.projects.last.name, 'added elsewhere');
      await bloc.close();
    });

    test(
      'refresh replaces rather than appends, so rows never duplicate',
      () async {
        final repo = _FakeRepository([
          [_project('a', 'one'), _project('b', 'two')],
          [_project('a', 'one')],
        ]);
        final bloc = ProjectsBloc(repo);

        bloc.add(const ProjectsEvent.listRequested());
        await bloc.stream.firstWhere(
          (s) => s.listStatus == PagedFeedStatus.loaded,
        );
        bloc.add(const ProjectsEvent.listRefreshed());
        await bloc.stream.firstWhere(
          (s) => s.listStatus == PagedFeedStatus.loaded,
        );

        // A project deleted server-side must disappear locally too — an
        // append would leave it on screen forever.
        expect(bloc.state.projects.length, 1);
        await bloc.close();
      },
    );

    blocTest<ProjectsBloc, ProjectsState>(
      'passes through refreshing so RefreshIndicator can await the end',
      build: () => ProjectsBloc(
        _FakeRepository([
          [_project('a', 'one')],
        ]),
      ),
      act: (bloc) => bloc.add(const ProjectsEvent.listRefreshed()),
      verify: (bloc) => expect(bloc.state.listStatus, PagedFeedStatus.loaded),
    );
  });
}
