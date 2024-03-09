<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;
use Illuminate\Support\Facades\Validator;
use DB;

class AdminController extends Controller
{
    public function insert_event(Request $request) {
        try {

            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:300',
                'description' => 'required',
                'location' => 'required',
                'date' => 'required|date'
            ]);
        
            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 422);
            }
            
            $event = new Event();
            $event->name = $request->name;
            $event->description = $request->description;
            $event->location = $request->location;
            $event->date = date('Y-m-d',strtotime($request->date));
            $data = $event->save();
            $status = 201;
            if ($data) {
                $status = 200;
                $response['status'] = '1';
                $response['title'] = "successfully";
                $response['message'] = "Event has been created successfully.";
            } else {
                $status = 201;
                $response['status'] = '0';
                $response['title'] = "failure";
                $response['message'] = "Oops! Something went wrong.";
            }
            return response($response, $status);
        } catch (\Exception $e) {
            $response['status'] = "0";
            $response['Error'] = $e->getMessage();
            return response($response, 500);
        }
    }

    public function update_event(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:300',
                'description' => 'required',
                'location' => 'required',
                'date' => 'required|date'
            ]);
        
            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 422);
            }

            $event = Event::find($request->id);
            $event->name = $request->name;
            $event->description = $request->description;
            $event->location = $request->location;
            $event->date = date('Y-m-d',strtotime($request->date));
            $data = $event->save();
            $status = 201;
            if ($data) {
                $status = 200;
                $response['status'] = '1';
                $response['title'] = "successfully";
                $response['message'] = "Event has been updated successfully.";
            } else {
                $status = 201;
                $response['status'] = '0';
                $response['title'] = "failure";
                $response['message'] = "Oops! Something went wrong.";
            }
            return response($response, $status);
        } catch (\Exception $e) {
            $response['status'] = "0";
            $response['Error'] = $e->getMessage();
            return response($response, 500);
        }
    }

    public function event_details(Request $request) {
     
        $limit = $request->get('limit') ? $request->get('limit') : 10;
        $skip = $request->get('page') ? $request->get('page') : 0;
        $skip = $skip * $limit;
        $sortField = $request->get('sort') ? $request->get('sort') : 'id';
        $sortType = $request->get('order') ? $request->get('order') : 'desc';
        $search = $request->get('search') ? $request->get('search') : '';

      
        $event = Event::limit($limit)
                ->skip($skip)
                ->orderBy($sortField, $sortType)
                ->get();
        if (!empty($search)) {
            $event = Event::search($search)
                    ->limit($limit)
                    ->skip($skip)
                    ->orderBy($sortField, $sortType)
                    ->get();    
        }
    
        $dataArray = array(
            "data" => $event,
        );

        $status = 200;
        $response = $dataArray;
        $response['status'] = "1";
        $response['title'] = "successfully";
        $response['message'] = "Event has been fetched successfully.";
        return response($response, $status);
    }

    public function destroy($id){
      
        $event = Event::find($id);
       if (!$event) {
            return response()->json(['message' => 'Data not found'], 404);
        }
        $event->delete();

        return response()->json(['message' => 'Event has been deleted successfully'], 200);
    }

}
