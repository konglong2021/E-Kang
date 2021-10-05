<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoriesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'kh_name' => $this->kh_name,
            'description' => $this->description,
            'products_count' => $this->products_count,
            'brands' => BrandResource::collection($this->whenLoaded('brands')),

        ];
    }
}
