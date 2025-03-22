<?php

namespace App\Http\Controllers\Admin;

use LaravelDaily\LaravelCharts\Classes\LaravelChart;

class HomeController
{
    public function index()
    {
        /*$settings1 = [
            'chart_title'           => 'Số lượng Player',
            'chart_type'            => 'line',
            'report_type'           => 'group_by_date',
            'model'                 => 'App\Models\GameUser',
            'group_by_field'        => 'joindate',
            'group_by_period'       => 'day',
            'aggregate_function'    => 'count',
            'filter_field'          => 'joindate',
            'filter_days'           => '90',
            'group_by_field_format' => 'Y-m-d H:i:s',
            'column_class'          => 'col-md-12',
            'entries_number'        => '5',
            'translation_key'       => 'gameUser',
        ];

        $chart1 = new LaravelChart($settings1);*/

//        return view('admin.home', compact('chart1'));
        return view('admin.home');
    }
}
