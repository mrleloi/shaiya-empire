<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\CsvImportTrait;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyGuideRuleRequest;
use App\Http\Requests\StoreGuideRuleRequest;
use App\Http\Requests\UpdateGuideRuleRequest;
use App\Models\GuideRule;
use Gate;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class GuideRulesController extends Controller
{
    use MediaUploadingTrait, CsvImportTrait;

    public function index(Request $request)
    {
        abort_if(Gate::denies('guide_rule_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        if ($request->ajax()) {
            $query = GuideRule::query()->select(sprintf('%s.*', (new GuideRule)->table));
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'guide_rule_show';
                $editGate      = 'guide_rule_edit';
                $deleteGate    = 'guide_rule_delete';
                $crudRoutePart = 'guide-rules';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : '';
            });
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : '';
            });
            $table->editColumn('header', function ($row) {
                return $row->header ? $row->header : '';
            });
            $table->editColumn('play_nice_policies_title', function ($row) {
                return $row->play_nice_policies_title ? $row->play_nice_policies_title : '';
            });
            $table->editColumn('tos_title', function ($row) {
                return $row->tos_title ? $row->tos_title : '';
            });
            $table->editColumn('agreement_title', function ($row) {
                return $row->agreement_title ? $row->agreement_title : '';
            });

            $table->rawColumns(['actions', 'placeholder']);

            return $table->make(true);
        }

        return view('admin.guideRules.index');
    }

    public function create()
    {
        abort_if(Gate::denies('guide_rule_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.guideRules.create');
    }

    public function store(StoreGuideRuleRequest $request)
    {
        $guideRule = GuideRule::create($request->all());

        if ($media = $request->input('ck-media', false)) {
            Media::whereIn('id', $media)->update(['model_id' => $guideRule->id]);
        }

        return redirect()->route('admin.guide-rules.index');
    }

    public function edit(GuideRule $guideRule)
    {
        abort_if(Gate::denies('guide_rule_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.guideRules.edit', compact('guideRule'));
    }

    public function update(UpdateGuideRuleRequest $request, GuideRule $guideRule)
    {
        $guideRule->update($request->all());

        return redirect()->route('admin.guide-rules.index');
    }

    public function show(GuideRule $guideRule)
    {
        abort_if(Gate::denies('guide_rule_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.guideRules.show', compact('guideRule'));
    }

    public function destroy(GuideRule $guideRule)
    {
        abort_if(Gate::denies('guide_rule_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $guideRule->delete();

        return back();
    }

    public function massDestroy(MassDestroyGuideRuleRequest $request)
    {
        $guideRules = GuideRule::find(request('ids'));

        foreach ($guideRules as $guideRule) {
            $guideRule->delete();
        }

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function storeCKEditorImages(Request $request)
    {
        abort_if(Gate::denies('guide_rule_create') && Gate::denies('guide_rule_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $model         = new GuideRule();
        $model->id     = $request->input('crud_id', 0);
        $model->exists = true;
        $media         = $model->addMediaFromRequest('upload')->toMediaCollection('ck-media');

        return response()->json(['id' => $media->id, 'url' => $media->getUrl()], Response::HTTP_CREATED);
    }
}
