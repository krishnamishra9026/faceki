@extends('admin.layouts.default')

@section('admin.breadcrumb')
<li class='breadcrumb-item active'>Apis</li>
@endsection

@section('admin.content')
<div class="clearfix">
    <div class="col-lg">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-align-justify"></i> Apis List
                <a class="btn btn-primary" style="background-color: #55acee; float: right;" href="{{ route('admin.apis.create') }}" role="button"
            ><i class="fa fa-plus" aria-hidden="true"></i> Create Api</a>
            </div>
            <div class="card-body">
                 @if($apis->total())
                <table class="table table-responsive-sm table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($apis as $api )
                        <tr>
                            <td>{{ $api->name }}</td>
                            <td>{{ $api->description }}</td>                            
                            <td>{{ $api->created_at->diffForHumans() }}</td>
                            <td>
                                @if ($api->status === 1)
                                <span class="badge badge-success"> Enabled</span>
                                @else
                                <span class="badge badge-info"> Disabled</span>
                                @endif
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="User Actions">
                                    <a href="{{ URL::to('admin/apis/' . $api->id . '/edit') }}" data-toggle="tooltip" data-placement="top" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-edit "></i></a>
                                    <form action="{{ route('admin.apis.destroy', $api->id)}}" method="post">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-danger" type="submit"><i class="fa fa-trash-o "></i></b>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="card-body">
                    {{ $apis->links() }}
                </div>
                @else
                <div class="card-body">
                  <table class="table table-responsive-sm table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td colspan="5"><div class="card-text text-center error" style="color: red;">No Apis found.</div></td></tr>
                    
                </tbody>
                </table>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection