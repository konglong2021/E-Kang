<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
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
            "id"                    => $this->id,
            "invoice_id"            => $this->invoice_id,
            "customer_id"           => $this->customer_id,
            "warehouse_id"          => $this->warehouse_id,
            "user_id"               => $this->user_id,
            "subtotal"              => $this->subtotal,
            "vat"                   => $this->vat,
            "discount"              => $this->discount,
            "grandtotal"            => $this->grandtotal,
            "receive"               => $this->receive,
            "status"                => $this->status,
            "created_at"            => (string)($this->created_at),
            "updated_at"            => (string)($this->updated_at),
            'customer' => new CustomerResource($this->whenLoaded('customers'))
        ];
    }
}
