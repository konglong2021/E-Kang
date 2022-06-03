<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
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
            'order_id' => $this->order_id,
            'paid' => $this->paid,
            'pay_method' => $this->pay_method,
            'created_at' => (string)($this->created_at),
            'updated_at' => (string)($this->updated_at),
            'order' => new OrderResource($this->whenLoaded('order')),
            'customer' => new CustomerResource($this->whenLoaded('customers')),

        ];
    }
}
