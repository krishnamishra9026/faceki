@extends('admin.layouts.default')

@section('admin.breadcrumb')
<li class='breadcrumb-item '><a href="{{ route('admin.apis.index') }}">Apis</a></li> <li class='breadcrumb-item active'>Edit Api</li>
@endsection

@section('admin.content')
<div class="clearfix">
    <div class="card">
        <div class="card-header">
            <strong>Update Api</strong>
            <a class="btn btn-primary" style="background-color: #55acee; float: right;" href="{{ url(Session::get('back_apis_url')) }}" role="button"
            ><i class="fa fa-arrow-left" aria-hidden="true"></i> Go Back</a>
        </div>
        @if (session('status'))
        <div class="alert alert-success">
            {{ session('status') }}
        </div>
        @endif
        <div class="card-body">
            <form action="{{ route('admin.apis.update', $api->id) }}" method="POST" class="form-horizontal offset-sm-2">
                    {!! csrf_field() !!}
                    @method('PUT')
                <div class="form-group row">
                    <label class="col-md-3 col-form-label" for="hf-name">Api Name</label>
                    <div class="col-md-6">
                        <input type="text" id="name" name="name" class="form-control" value="{{ $api->name }}"
                            placeholder="Enter Api name..">

                            @if ($errors->has('name'))
                                <span class="text-danger">{{ $errors->first('name') }}</span>
                            @endif
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-md-3 col-form-label" for="hf-name">Api Description</label>
                    <div class="col-md-6">
                        <textarea id="description" name="description" class="form-control" placeholder="Enter Api description..">{{ $api->description }}</textarea>

                            @if ($errors->has('description'))
                                <span class="text-danger">{{ $errors->first('description') }}</span>
                            @endif
                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-md-3 col-form-label" for="hf-name">Api Status</label>
                    <div class="col-md-6">
                        <select id="status" type="" class="form-control" name="status">
                            <option value="0" {{ $api->status == '0' ? 'selected' : '' }}>Disable</option>
                            <option value="1" {{ $api->status == '1' ? 'selected' : '' }}>Enable</option>
                        </select>

                        @if ($errors->has('status'))
                            <span class="text-danger">{{ $errors->first('status') }}</span>
                        @endif
                    </div>
                </div>
               
                <center><button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-dot-circle-o"></i> Update</button></center>
            </form>
        </div>
    </div>
</div>
@endsection